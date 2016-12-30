. $HOME/config/aliases
. $HOME/.devscripts

# Borrowed from 
# http://www.unixmantra.com/2013/05/setting-custom-prompt-in-ksh.html
PS1='$(logname)@$(hostname -s)$PWD$ '

GOPATH=$HOME/coding/go
PATH=$PATH:$GOPATH/bin

PATH=$PATH:~/bin
EDITOR=vi

export PATH GOPATH EDITOR
