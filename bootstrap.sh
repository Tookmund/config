#!/bin/sh
# Bootstrap and remove my config files
# Assumes this is cloned to $HOME/config
# ./bootstrap.sh ln to hardlink all files
# ./bootstrap.sh unlink to unlink all files
# ./bootstrap.sh cp to copy all files
# etc.

MV=${1:-ln -s}

for i in profile devscripts quiltrc-dpkg nanorc dput.cf lintianrc
do
	$MV "$PWD/$i" "$HOME/.$i"
done

# i3wm
$MV "$PWD/i3.xsession" "$HOME/.xsession"
$MV "$PWD/i3config" "$HOME/.config/i3/config"
$MV "$PWD/i3status.conf" "$HOME/.config/i3status/config"

# GPG Configuration File
$MV "$PWD/gpg.conf" "$HOME/.gnupg/gpg.conf"
$MV "$PWD/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"

#Neovim
$MV "$PWD/init.vim" "$HOME/.config/nvim/init.vim"
