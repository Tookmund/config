. $HOME/config/aliases
. $HOME/config/devscripts

# Borrowed from 
# http://www.unixmantra.com/2013/05/setting-custom-prompt-in-ksh.html
PS1='$(logname)@$(hostname -s)$PWD$ '

GOPATH=$HOME/coding/go
PATH=$PATH:$GOPATH/bin

PATH=$PATH:~/bin
EDITOR=vi

GPG_TTY="$(tty)"
SSH_AUTH_SOCK="/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"

export PATH GOPATH EDITOR GPG_TTY SSH_AUTH_SOCK

gpgconf --launch gpg-agent
