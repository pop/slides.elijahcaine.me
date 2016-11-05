#!/bin/bash
VENV='.venv'

source $VENV/bin/activate

sphinx-build -a -E -b slides source output

find output -name '*.html' -exec sed -i 's/_static/static/g' {} \;
find output -name '*.html' -exec sed -i 's/_images/images/g' {} \;

mv output/_static output/static
mv output/_images output/images

deactivate
