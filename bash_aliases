alias lock='xscreensaver-command -lock'

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

alias ll='ls -l'
alias la='ls -a'

alias x='startx'

if [ -f ~/config/bash_apt ]
then
	. ~/config/bash_apt
fi 
