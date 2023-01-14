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
    if [[ $- == *i* ]]
    then
        printf "an interactive "
    else
        printf "a non-interactive "
    fi

    if shopt -q login_shell
    then
        printf "login"
    else
        printf "non-login "
    fi
    printf "shell\n"
}

print_shell_type