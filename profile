. $HOME/config/aliases
. $HOME/config/devscripts

# Borrowed from
# http://www.unixmantra.com/2013/05/setting-custom-prompt-in-ksh.html
PS1='$(id -un)@$(hostname -s)$PWD$ '
PROMPT="%n@%m%d%% "

GOPATH=$HOME/coding/go
PATH="$PATH:$GOPATH/bin"

PATH="$PATH:$HOME/.cargo/bin"

PATH="$PATH:$HOME/bin:."

GPG_TTY="$(tty)"
SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

EDITOR=vi

export PS1 PROMPT PATH GOPATH EDITOR GPG_TTY SSH_AUTH_SOCK

gpgconf --launch gpg-agent

. $HOME/config/custom
