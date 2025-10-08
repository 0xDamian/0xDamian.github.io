#!/bin/bash
set -euo pipefail

# Configuration
FOLDER="/home/dex/Documents/damnsec/static"
WIDTH=800
HEIGHT=600
HASHFILE="$FOLDER/.image_hashes"

# Dependencies: imagemagick, jpegoptim, optipng, img-optimize
for cmd in convert md5sum img-optimize jpegoptim optipng; do
    if ! command -v $cmd &> /dev/null; then
        echo "$cmd not found."
        exit 1
    fi
done

# Ensure hashfile exists
touch "$HASHFILE"

# Load existing hashes
declare -A old_hashes
while read -r hash file; do
    old_hashes["$file"]="$hash"
done < "$HASHFILE"

tmpfile=$(mktemp)
updated=0

find "$FOLDER" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.gif' -o -iname '*.webp' \) | while read -r img; do
    new_hash=$(md5sum "$img" | awk '{print $1}')
    relpath="${img#$FOLDER/}"

    if [[ "${old_hashes[$relpath]:-}" != "$new_hash" ]]; then
        echo "Optimizing $relpath ..."
        case "$img" in
            *.png|*.jpg|*.jpeg|*.gif|*.webp)
                convert "$img" -resize "${WIDTH}x${HEIGHT}>" "$img"
                ;;
        esac
        img-optimize --std --path "$(dirname "$img")" > /dev/null 2>&1 || true
        updated=$((updated+1))
    fi

    echo "$new_hash $relpath" >> "$tmpfile"
done

mv "$tmpfile" "$HASHFILE"

echo "Optimization complete. Updated $updated image(s)."

