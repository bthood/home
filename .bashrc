# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    source $HOME/bin/zz-git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM="auto"
    chroot='${debian_chroot:+($debian_chroot)}'
    time='\[\e[00;36m\]\t\[\e[0m\]'
    user_host='\[\e[01;32m\]\u@\h\[\e[0m\]'
    cwd='\[\e[01;34m\]\w\[\e[0m\]'
    gitps1='\[\e[00;31m\]$(__git_ps1 "[%s] ")\[\e[0m\]'
    prompt='\[\e[01;34m\]\$\[\e[0m\]'
    PS1="$chroot$time $user_host $cwd $gitps1$prompt "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt chroot time user_host cwd gitps1 prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Use VIM as the default editor and less as the pager
export EDITOR='/usr/bin/vim'
export LESS='-i -N -w -z-4 -g -e -M -X -F -Q -R'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
export PAGER='less -e'
export VISUAL='vim'


# History configuration
export HISTCONTROL=ignoreboth:erasedups # don't put duplicates in history
export HISTIGNORE='&:[bf]g:ls:h:clear:exit'
export HISTSIZE=10000                                # increase or decrease the size of the history to '10,000'
export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%a  '        # makes history display in YYYY-MM-DD_HH:MM:SS_3CharWeekdaySpaceSpace format
# Save commands in history & share in real time
if [ ! -f $HOME/.bash_history ]; then touch $HOME/.bash_history; fi
PROMPT_COMMAND="history -a && history -n; $PROMPT_COMMAND"


# Shell options
set -b           # show background job status immediately
set -o notify    # notify when background jobs finish
set +o nounset   # needed for some completions
setterm -blength 0  # disable bell
shopt -s cdspell    # minor cd spell corrections
shopt -s extglob nocaseglob no_empty_cmd_completion
shopt -s histappend histreedit histverify


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# add SSH keys to running shell for easier SSHing
ssh-add


# add ~/bin to the PATH
export PATH="$HOME/bin:${PATH#"$HOME/bin:"}"


# Run .bashrc.local if it exists
if [ -f ~/.bashrc.local ]; then
   . ~/.bashrc.local
fi
