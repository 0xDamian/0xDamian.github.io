#!/bin/bash
set -euo pipefail

# Configuration
FOLDER="/home/dex/Documents/damnsec/static"
WIDTH=800
HEIGHT=600
HASHFILE="$FOLDER/.image_hashes"

# Dependencies: imagemagick, jpegoptim, optipng, gifsicle
for cmd in magick md5sum jpegoptim optipng gifsicle; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "$cmd not found."
        exit 1
    fi
done

touch "$HASHFILE"

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
            *.jpg|*.jpeg)
                magick "$img" -resize "${WIDTH}x${HEIGHT}>" "$img"
                jpegoptim --strip-all --max=85 "$img" >/dev/null
                ;;
            *.png)
                magick "$img" -resize "${WIDTH}x${HEIGHT}>" "$img"
                optipng -o7 "$img" >/dev/null
                ;;
            *.gif)
                gifsicle -O3 --colors 256 "$img" -o "$img" >/dev/null
                ;;
            *.webp)
                magick "$img" -resize "${WIDTH}x${HEIGHT}>" "$img"
                ;;
        esac
        updated=$((updated+1))
    fi

    echo "$new_hash $relpath" >> "$tmpfile"
done

mv "$tmpfile" "$HASHFILE"

echo "Optimization complete. Updated $updated image(s)."

