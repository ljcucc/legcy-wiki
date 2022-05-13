#!/bin/sh

rm -rf ./docs/*

for file in ./md/*; do
  filename=$(basename $file)
  output=./docs/${filename/.md/.html}
  pandoc $file -o $output --template=./src/template.html -f markdown+autolink_bare_uris
done

cp ./src/index.html ./docs/

echo $(python3 - << EOF
print("""$(cat ./docs/index.html)""".replace("\$toc\$","""$(./bin/generate_menu.sh)"""))
EOF
) > ./docs/index.html

cp ./src/style.css ./docs/
cp  -rf ./assets ./docs/