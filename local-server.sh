#!/usr/bin/env bash

./local-build.sh

# Check if python2 or python3
# python -m SimpleHTTPServer # python2
python -m http.server # python3
