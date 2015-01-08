#!/bin/bash

#
# usage: new-element <element-name>
#

#
# The element-name must contain a hyphen
#
if [ -d $1 ]
then
	echo "$1 must not exist in this folder"; exit 1;
fi

if [ -d elements/$1 ]
then
	echo "$1 element already exists"; exit 1;
fi

#
# replace files and strings with given element name
#
cp -a seed-element-master $1
cd $1
for i in seed-element*; do mv $i "${i/seed-element/$1}"; done
grep -rl seed-element . | xargs sed -i "" "s/seed-element/$1/g"

#
# install in elements folder
#
cd ..
mv $1 elements