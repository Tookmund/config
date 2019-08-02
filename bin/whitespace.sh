#!/bin/sh
# Strip trailing whitespace

sed -i 's/[  \t]*$//' "$@" 
