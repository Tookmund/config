#!/bin/sh
# https://unix.stackexchange.com/a/278948
echo -n "$1" | iconv -t utf16le | openssl md4 | sed 's/(stdin)= /password=hash:/g'
