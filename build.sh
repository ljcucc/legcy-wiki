#!/bin/sh

HTML_DIR="./dist/"

rm -rf ./dist/*

for file in ./md/*; do
  filename=$(basename $file)
  output=$HTML_DIR${filename/.md/.html}
  pandoc $file -o $output --template=./src/template.html
done

cp ./src/index.html ./dist/
cp ./src/style.css ./dist/