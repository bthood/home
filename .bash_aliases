#!/bin/sh
#
#~/.bash_aliases: executed by .bashrc when the shell is loaded.
# Contains default aliases to avoid cluttering .bashrc.


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# update the alias file with 'aliases'
alias aliases="source $HOME/.bash_aliases"


# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'


# git helpers
alias gti='git'
alias igt='git'
alias gt='git'
alias gi='git'
alias g='git'


# gradle helpers
alias gradle='./gradlew'
alias gradlew='./gradlew'
alias gw='./gradlew'

