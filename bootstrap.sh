#!/bin/sh
# Bootstrap and remove my config files
# Assumes this is cloned to $HOME/config
# ./bootstrap.sh ln to hardlink all files
# ./bootstrap.sh unlink to unlink all files
# ./bootstrap.sh cp to copy all files
# etc.


for i in profile devscripts quiltrc-dpkg nanorc dput.cf lintianrc
do
	$1 "$PWD/$i" "$HOME/.$i"
done

# i3wm
$1 "$PWD/i3.xsession" "$HOME/.xsession"
$1 "$PWD/i3config" "$HOME/.config/i3/config"
$1 "$PWD/i3status.conf" "$HOME/.config/i3status/config"

# GPG Configuration File
$1 "$PWD/gpg.conf" "$HOME/.gnupg/gpg.conf"
$1 "$PWD/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
