#!/bin/bash

# To demo all types of shells, open a terminal emulator and follow steps below 

# The current interactive shell type
# >> source print_shell_type.sh

# Non-interactive non-login shell (.bashrc executed)
# >> ./print_shell_type.sh

# Non-interactive login shell
# >> bash -l print_shell_type

# Interactive non-login shell (.bashrc executed)
# >> bash
# >> source print_shell_type.sh
# >> exit

# Interactive login shell (.bash_profile executed)
# >> bash -l
# >> source print_shell_type.sh
# >> exit

function print_shell_type() {
    printf "Running "
    if [[ $- == *i* ]]; then
        printf "an interactive "
    else
        printf "a non-interactive "
    fi

    #if 
    if [ -n "$ZSH_VERSION" ] && [[ -o login ]]; then
        printf "login "
    elif [ -n "$BASH_VERSION" ] && shopt -q login_shell; then
        printf "login "
    else
        printf "non-login "
    fi

    if [ -n "$ZSH_VERSION" ]; then
        printf "Z shell"
    elif [ -n "$BASH_VERSION" ]; then
        printf "bash shell"
    else
        printf "unknown shell"
    fi
    printf "\n"
}

print_shell_type