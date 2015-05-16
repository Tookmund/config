#alias lock='xscreensaver-command -lock'

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

alias ll='ls -l'
alias la='ls -a'

# Make apt easier to type

# Use apt if installed
if hash apt
then
	alias agu="sudo apt update"
	alias agdu="sudo apt full-upgrade"
	alias agug="sudo apt upgrade"
	alias acs="sudo apt search"
	alias agi="sudo apt install"

else
	alias agu="sudo apt-get update"
	alias agdu="sudo apt-get dist-upgrade"
	alias agug="sudo apt-get upgrade"
	alias acs="apt-cache search"
	alias agi="sudo apt-get install"
fi

alias agp="sudo apt-get purge"
alias agar="sudo apt-get autoremove"
alias agac="sudo apt-get autoclean"

alias x='startx'
