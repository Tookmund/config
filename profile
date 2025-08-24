. $HOME/config/devscripts


GOPATH=$HOME/coding/go
PATH="$PATH:$GOPATH/bin"

PATH="$PATH:$HOME/.cargo/bin"

# BSD-style paths
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"

PATH="$PATH:$HOME/bin:."


GPG_TTY="$(tty)"
SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

EDITOR=vi

export PS1 PROMPT PATH GOPATH EDITOR GPG_TTY SSH_AUTH_SOCK

gpgconf --launch gpg-agent

