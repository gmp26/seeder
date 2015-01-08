#!/bin/bash

#
# Run all elements that have livescript sources through the compiler
#
find elements -name '*.ls' | xargs -I{} lsc -cb {}
