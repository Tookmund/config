#!/bin/sh
# Bootstrap and remove my config files
# Assumes this is cloned to $HOME/config
# ./bootstrap.sh ln to hardlink all files
# ./bootstrap.sh unlink to unlink all files
# ./bootstrap.sh cp to copy all files
# etc.

for i in profile devscripts xinitrc quiltrc-dpkg nanorc dput.cf lintianrc
do
	$1 $i $HOME/.$i
done

# GPG Configuration File
$1 gpg.conf $HOME/.gnupg/gpg.conf
