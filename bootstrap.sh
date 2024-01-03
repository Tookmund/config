#!/bin/sh
# Bootstrap and remove my config files
# Assumes this is cloned to $HOME/config
# ./bootstrap.sh ln to hardlink all files
# ./bootstrap.sh unlink to unlink all files
# ./bootstrap.sh cp to copy all files
# etc.

MV=${1:-ln -s}

for i in profile devscripts quiltrc-dpkg nanorc dput.cf lintianrc xscreensaver exrc
do
	$MV "$PWD/$i" "$HOME/.$i"
done

mkdir -p "$HOME/bin"

for i in bin/*
do
	$MV "$PWD/$i" "$HOME/$i"
done

# ZSH
$MV "$PWD/profile" "$HOME/.zprofile"

for SHRC in .mkshrc .zshrc
do
	$MV "$PWD/shrc" "$HOME/$SHRC"
done

# i3wm
$MV "$PWD/i3.xsession" "$HOME/.xsession"
mkdir -p "$HOME/.config/i3/"
$MV "$PWD/i3config" "$HOME/.config/i3/config"
mkdir -p "$HOME/.config/i3status/"
$MV "$PWD/i3status.conf" "$HOME/.config/i3status/config"

# sway
mkdir -p "$HOME/.config/sway/"
$MV "$PWD/swayconfig" "$HOME/.config/sway/config"

# GPG Configuration Files
mkdir -p "$HOME/.gnupg/"
$MV "$PWD/gpg.conf" "$HOME/.gnupg/gpg.conf"
$MV "$PWD/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
$MV "$PWD/dirmngr.conf" "$HOME/.gnupg/dirmngr.conf"

#Neovim
mkdir -p "$HOME/.config/nvim"
$MV "$PWD/init.vim" "$HOME/.config/nvim/init.vim"

#youtube-dl
mkdir -p "$HOME/.config/youtube-dl"
$MV "$PWD/youtube-dl-config" "$HOME/.config/youtube-dl/config"
