#!/bin/sh

rm -rf ./docs/*

for file in ./md/*; do
  filename=$(basename $file)
  output=./docs/${filename/.md/.html}
  pandoc $file -o $output --template=./src/template.html
done

cp ./src/index.html ./docs/
cp ./src/style.css ./docs/