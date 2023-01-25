################################################################################
[[ $- == *i* ]] && is_interactive_shell=true || is_interactive_shell=false
if [ "$is_interactive_shell" = true ]; then
    green="$(tput setaf 2)"
    reset="$(tput sgr0)"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
    if [ "$is_interactive_shell" = true ]; then
        printf "${green}✔ == Completed running /etc/bashrc ==${reset}\n"
    fi
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
module load gcc

if [ "$is_interactive_shell" = true ]; then
    printf "${green}✔ == Completed running arete_am_bashrc.sh ==${reset}\n"
fi
