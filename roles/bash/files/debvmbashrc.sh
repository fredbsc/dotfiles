#/bin/bash
# !!!! We will overwrite this file on next vmssh into this machine !!!
# '''' User .bash_local for local changes !!!

alias ducks='du -cks * | sort -rn | head -11'
#system helpers

alias ..="cd .."
alias ...="cd ../.."
alias h='cd ~'
alias c='clear'
alias b='cd ~-'
alias hg='history | grep'
alias realias='source ~/.bash_aliases'



#Python
alias p='python'

# change dir and ls
function cl() {
    builtin cd "$@" && ls
}
alias cl=cl

function cla() {
    builtin cd "$@" && ls -all
}
alias cla=cla

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}
alias mcdir=mkd

function xtree {
    find ${1:-.} -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

#docker
alias dc='docker-compose'

#git
alias gco='git commit'
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gs='git status'
alias gl='git log'
alias gch='git checkout'
alias gg='git log --pretty=format:"%h : %s" --graph'

export EDITOR=vi
set -o vi

# update
alias upgrade='echo "apt update and upgrade?";sudo apt-get update && sudo apt-get upgrade -yy'


# RANGER - file manager
# after ranger quits, cd to the chosen directory.
r() {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# after ranger quits, cd to the chosen directory.
rd() {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --show-only-dirs --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

mcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"

}


if [ -f ~/.bash_local ]; then
      . ~/.bash_local   # --> Read .bash_local, if present.
fi
