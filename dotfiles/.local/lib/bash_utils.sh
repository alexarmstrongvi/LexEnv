################################################################################
# Utility functions and aliases
#
# This SHOULD NOT set environment variables or configure the shell behavior
################################################################################
function is_interactive_shell() {
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
    # To demo all types of shells, open a terminal emulator and follow steps below 
    # 1) The current interactive shell type
    #   >> print_shell_type
    # 2) Non-interactive non-login shell ($BASHENV executed)
    #   >> bash scripts/print_shell_type.sh
    # 3) Non-interactive login shell ($BASHENV executed)
    #   >> bash -l scripts/print_shell_type.sh
    # 4) Interactive non-login shell (.bashrc executed)
    #   >> bash
    #   >> print_shell_type
    #   >> exit
    # 5) Interactive login shell (.bash_profile executed)
    #   >> bash -l
    #   >> print_shell_type
    #   >> exit
    printf "In "
    if is_interactive_shell; then
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

remove_path_duplicates() {
    old_path="$1"
    if [ -z "$old_path" ]; then
        # No paths in PATH
        return 0
    fi
    
    new_path=""
    
    # Pop single paths from the front until no paths left 
    while [ -n "$old_path" ]; do
        # Pop single path from front
        front_path=${old_path%%:*} 
        # Check if last path element popped (i.e. no more ":" separators)
        if [[ $old_path != *:* ]]; then
            old_path=""
        fi
        # Trim "*:" (i.e. front_path) off the front of old_path
        old_path=${old_path#*:}

        # Update new path 
        case $new_path: in
            *:"$front_path":*) ;; # front_path in new_path
            *) new_path=$new_path:$front_path;; # append front_path to new_path
        esac
    done
    # Trim ":" off the front of new_path
    new_path=${new_path#:}
    unset old_path front_path
    echo "$new_path"
}
################################################################################
# Print styles
# Taken from https://natelandau.com/bash-scripting-utilities/
if is_interactive_shell; then
    fmt_reset="$(tput sgr 0)"
    fmt_bold="$(tput bold)"
    fmt_underline="$(tput sgr 1)"
    fmt_red="$(tput setaf 9)"
    fmt_green="$(tput setaf 10)"
    fmt_yellow="$(tput setaf 11)"
    fmt_blue="$(tput setaf 12)"
    fmt_purple="$(tput setaf 13)"
    fmt_cyan="$(tput setaf 14)"
    fmt_grey="$(tput setaf 15)"
fi
# Special formats
print_header() {
    printf "\n${fmt_bold}${fmt_purple}==========  %s  ==========${fmt_reset}\n" "$@"
}
print_arrow() {
    printf "➜ $@\n"
}
print_success() {
    printf "${fmt_green}✔ %s${fmt_reset}\n" "$@"
}
print_error() {
    printf "${fmt_red}✖ %s${fmt_reset}\n" "$@"
}
print_warning() {
    printf "${fmt_yellow}➜ %s${fmt_reset}\n" "$@"
}
print_note() {
    printf "${fmt_underline}${fmt_bold}${fmt_blue}Note:${fmt_reset}  ${fmt_blue}%s${fmt_reset}\n" "$@"
}

################################################################################
function ordinal() {
    # Example
    # >> echo "You got $(ordinal $n) place"
    case "$1" in
        *1[0-9] | *[04-9]) echo "$1"th;;
        *1) echo "$1"st;;
        *2) echo "$1"nd;;
        *3) echo "$1"rd;;
    esac
}

function enumerate() {
    # Example
    # >> ls /path | enumerate
    awk '{print NR ") " $0}'
}
