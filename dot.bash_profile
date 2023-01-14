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
source ${HOME}/LexTools/bashTools.sh

# Pretty colors
if [ -e /usr/share/terminfo/*/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=gxfxcxdxbxegedabagacad # Dark lscolor scheme

# Change Prompt
export PS1="\e[0;32m________________________________________________________________________________\e[m\n\
| \e[0;34m\w \e[m(\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) @ \e[0;33m\h\e[m)\n\
| => "

# Set Default Editor (change 'Nano' to the editor of your choice)
export VISUAL=vim
export EDITOR="$VISUAL"


# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
export BLOCKSIZE=1k


################################################################################
# Useful functions and aliases

alias showPATH="tr ':' '\n' <<< \""'$PATH'"\""
alias showPYPATH="tr ':' '\n' <<< \""'$PYTHONPATH'"\""
alias reload='source ~/.bash_profile'
pwdf() { echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"); }
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias tally='sort | uniq -c | sort -rn'    # Tally up occurances in output

################################################################################
#   2.  SITE SPECIFIC
################################################################################

if [ -f ~/LexEnv/local_bash_profile.sh ]; then
    # Add symlink to include local profile (keep name convention below)
    source ~/LexEnv/local_bash_profile.sh;
fi

################################################################################
e_success "== Completed running .bash_profile =="
