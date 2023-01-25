################################################################################
# Configure interactive login bash shells
#
# Configuration related to interactive shells goes here. In an interactive
# non-login shell (e.g. VS Code terminal), note this script may not be executed
# automatically. So source it manually if wanted.
################################################################################

# Include any non-login shell configurations
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


# Set default blocksize when displaying disk memory space in ls, df, du
# https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export BLOCKSIZE=1k # 1024 byte blocks


################################################################################
# Useful functions and aliases
alias showPATH="tr ':' '\n' <<< \""'$PATH'"\""
alias showPYPATH="tr ':' '\n' <<< \""'$PYTHONPATH'"\""
alias reload='source ~/.bash_profile'
# Print path to file
pwdf() { echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"); }
# Verbose ls
alias ll='ls -FGlAhp'
 # Tally up occurances in output
alias tally='sort | uniq -c | sort -rn'

################################################################################
#   2.  SITE SPECIFIC
################################################################################

if [ -f ~/LexEnv/local_bash_profile.sh ]; then
    # Add symlink to include local profile (keep name convention below)
    source ~/LexEnv/local_bash_profile.sh;
fi

################################################################################
e_success "== Completed running .bash_profile =="
