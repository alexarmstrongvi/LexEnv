################################################################################
#
#  Description:  This file holds all my BASH configurations and aliases
#
################################################################################

# Include any bashrc configuration
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

################################################################################
#   1.  GENERIC UNIX CONFIGURATION
################################################################################

############################################################################
# Enviornment conifguration

# Pretty colors
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=gxfxcxdxbxegedabagacad # Dark lscolor scheme

# Colors and Style
# Taken from https://natelandau.com/bash-scripting-utilities/
bold="\[$(tput bold)\]"
underline="\[$(tput sgr 0 1)\]"
reset="\[$(tput sgr0)\]"

red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
tan="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
purple="\[$(tput setaf 5)\]"
grey="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"

# Change Prompt
#export PS1=\
#"\[${green}________________________________________________________________________________${reset}\n\
#| ${tan} \w ${reset} @ ${grey} \h ${reset} ) \n| => \]"
#export PS2="| => "
export PS1="\e[0;32m________________________________________________________________________________\e[m\n\
| \e[0;34m\w \e[m@ \e[0;33m\h\e[m)\n\
| => "
#export PS1="________________________________________________________________________________\n\
#| \w @ \h)\n"
#export PS2="| => "
# Set Default Editor (change 'Nano' to the editor of your choice)

export VISUAL=vim
export EDITOR="$VISUAL"


# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
export BLOCKSIZE=1k


################################################################################
# Useful functions and aliases

# General
alias showPATH="tr ':' '\n' <<< \"$PATH\""
alias reload='source ~/.bash_profile && source ~/.bashrc'
pwdf() { echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"); }
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels


# Preferred implementations
alias cpe='cp -iv'                           # Preferred 'cp' implementation
alias mve='mv -iv'                           # Preferred 'mv' implementation
alias mkdire='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias lesse='less -FSRXc'                    # Preferred 'less' implementation
cde() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'

################################################################################
#   2.  SITE SPECIFIC
################################################################################

# Add symlink to include local profile (keep name convention below)
source ~/LexEnv/local_bash_profile.sh
