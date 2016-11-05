#!/bin/bash
VENV='.venv'

git stash
rm -rf output/

eval local-build.sh

rm -rf /tmp/build_output
mv output /tmp/build_output

git checkout master

rm -rf ./*
mv /tmp/build_output/* ./
mv ./static/CNAME ./CNAME

git add .
git commit -m "Site compiled on `date`"
git push origin master
git checkout source
git stash pop
