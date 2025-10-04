#!/usr/bin/env python3
import os
import re
from urllib.parse import quote

posts_dir = "/home/dex/Documents/damnsec/content/blog/"

# Matches Obsidian-style embeds like:
# ![[static/blog/Start-Cyber/img5.png]]
# [[static/blog/Start-Cyber/img5.png|Alt text]]
obsidian_pattern = re.compile(
    r'!?\[\[(?P<file>static/blog/(?P<blog>[^/]+)/([^|\]]+\.(?:png|jpe?g|gif)))(?:\|(?P<alt>[^\]]+))?\]\]',
    re.IGNORECASE
)

# Matches Markdown-style image links like:
# ![](/static/blog/Start-Cyber/img.png)
markdown_pattern = re.compile(
    r'!\[(?P<alt>[^\]]*)\]\((?P<path>/static/blog/(?P<blog>[^/]+)/[^)]+)\)',
    re.IGNORECASE
)

updated_files = 0
total_replacements = 0

for root, _, files in os.walk(posts_dir):
    for fname in files:
        if not fname.lower().endswith(".md"):
            continue

        filepath = os.path.join(root, fname)
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        replaced = False

        # Handle Obsidian-style embeds
        def obsidian_repl(m):
            blog = m.group("blog").strip()
            filename = os.path.basename(m.group("file")).strip()
            alt = m.group("alt").strip() if m.group("alt") else ""
            encoded = quote(filename, safe="")
            return f"![{alt}](/../blog/{blog}/{encoded})"

        new_content = obsidian_pattern.sub(obsidian_repl, content)

        # Handle Markdown-style image links
        def markdown_repl(m):
            alt = m.group("alt").strip()
            path = m.group("path").replace("/static", "/..")
            return f"![{alt}]({path})"

        new_content = markdown_pattern.sub(markdown_repl, new_content)

        if new_content != content:
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(new_content)
            updated_files += 1
            total_replacements += len(obsidian_pattern.findall(content)) + len(markdown_pattern.findall(content))

print(f"Updated {updated_files} markdown file(s); replaced {total_replacements} image link(s).")
