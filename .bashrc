# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
_tags()
{
	if [ -f "./tags" ]; then
		COMPREPLY=( $(grep -h ^${COMP_WORDS[COMP_CWORD]} ./tags | cut -f 1) )
	fi
	return 0
}
complete -F _tags vit

alias ls="ls -lh --color"
alias cp="cp -v"
alias server="ssh server"
alias vit="vim -t"
alias pltags="find . -regex '.*/*\.p[l|m]' -type f -exec /usr/share/vim/vim73/tools/pltags.pl {} + > /dev/null"
alias screen="screen -d -R"
export MOZ_DISABLE_PANGO=1
export HISTCONTROL=ignoredups

export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \\$\[\033[00m\] "
