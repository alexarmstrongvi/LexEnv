#!/usr/bin/env bash
source ~/.local/lib/bash_utils.sh
print_shell_type

# To demo all types of shells, open a terminal emulator and follow steps below 

# The current interactive shell type
# >> source print_shell_type.sh

# Non-interactive non-login shell ($BASH_ENV sourced)
# >> ./print_shell_type.sh

# Non-interactive login shell ($BASH_ENV sourced)
# >> bash -l print_shell_type.sh

# Interactive non-login shell (.bashrc sourced)
# >> bash
# >> source print_shell_type.sh
# >> exit

# Interactive login shell (.bash_profile sourced)
# >> bash -l
# >> source print_shell_type.sh
# >> exit
