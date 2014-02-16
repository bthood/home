# ~/.bash_aliases: executed by .bashrc when the shell is loaded.
#
# Contains default aliases to avoid cluttering .bashrc.


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'


# git helpers
alias gmpr='git co master && echo `git rev-parse --abbrev-ref HEAD`'
alias gti='git'
alias igt='git'
alias gt='git'
alias gi='git'
alias g='git'
