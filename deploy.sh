#!/bin/bash
set -euo pipefail

# Change to the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Set variables
python_script="images.py"

# Check for required commands
for cmd in git python3 hugo; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "$cmd is not installed or not in PATH."
        exit 1
    fi
done

# Step 1: Process Markdown files with Python script
echo "Processing image links in Markdown files..."
if [ ! -f "$python_script" ]; then
    echo "Python script $python_script not found."
    exit 1
fi

python3 "$python_script" || { echo "Image processing failed."; exit 1; }

# Step 2: Build the Hugo site
echo "Building the Hugo site..."
hugo || { echo "Hugo build failed."; exit 1; }

# Step 3: Git staging and commit logic
echo "Checking for Git changes..."
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes detected."
else
    echo "Staging and committing changes..."
    git add .
    commit_message="New Blog Post on $(date +'%Y-%m-%d %H:%M:%S')"
    git commit -m "$commit_message"
fi

# Step 4: Push changes to the current branch
current_branch=$(git symbolic-ref --short HEAD)
echo "Pushing changes to branch: $current_branch"
git push origin "$current_branch" || { echo "Failed to push changes."; exit 1; }

echo "Deployment complete."
