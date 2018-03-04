#!/bin/bash
VENV='.venv'

source $VENV/bin/activate

rm -rf output

sphinx-build -a -E -b slides source output

find output -name '*.html' | xargs -n1 sed -i -E 's/_static/static/g';
find output -name '*.html' | xargs -n1 sed -i -E 's/_images/images/g';
find output -name '*.html' | xargs -n1 sed -i -E 's/_sources/sources/g';

mv output/_static output/static
mv output/_images output/images
mv output/_sources output/sources

deactivate
