#!/bin/sh

echo '$meta-json$' > /tmp/metadata.pandoc-tpl
for file in ./md/*; do
  echo $(python3 - << EOF
import json
metadata = """$(pandoc --template=/tmp/metadata.pandoc-tpl $file)"""
metadata = json.loads(metadata)
true="true"
if ("public" in metadata and metadata["public"]):
  title = metadata["title"]
  filename = "$(basename $file)".replace(".md", "")
  print(f'<li><a href=\"{filename}\">{title}</a></li>')
EOF
)
done
