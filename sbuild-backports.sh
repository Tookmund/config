#!/bin/sh
sbuild --build-dep-resolver=aptitude --extra-repository="deb http://deb.debian.org/debian stretch-backports main" -d stretch-backports $@ 
