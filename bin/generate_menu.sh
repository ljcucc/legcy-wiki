#!/bin/sh

echo '$meta-json$' > /tmp/metadata.pandoc-tpl
for file in ./md/*; do
  title=$(python3 - << EOF
import json
print($(pandoc --template=/tmp/metadata.pandoc-tpl $file)["title"])
EOF
  )
  filename=$(basename $file)
  echo "<li><a href=\"./${filename/.md/.html}\">$title</a></li>"
done
