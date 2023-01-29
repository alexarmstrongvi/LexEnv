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

function is_interative_shell() {
    [[ $- == *i* ]]
}

function is_zshell() {
    [ -n "$ZSH_VERSION" ]
}

function is_bash_shell() {
    [ -n "$BASH_VERSION" ]
}

function is_login_shell() {
    { is_zshell && [[ -o login ]]; } || { is_bash_shell && shopt -q login_shell; }
}


function print_shell_type() {
    printf "Running in "
    if is_interative_shell; then
        printf "an interactive "
    else
        printf "a non-interactive "
    fi

    #if 
    if is_login_shell; then
        printf "login "
    else
        printf "non-login "
    fi

    if is_zshell; then
        printf "Z shell"
    elif is_bash_shell; then
        printf "bash shell"
    else
        printf "unknown shell"
    fi
    printf "\n"
}

print_shell_type
