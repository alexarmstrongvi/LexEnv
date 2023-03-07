################################################################################
# Configure interactive bash shells
#
# ~/.bashrc is only sourced automatically in interactive non-login shells and so
# should be sourced from ~/.bash_profile to effect interactive login shells
################################################################################
source ~/LexEnv/bash_utils.sh
if ! is_interactive_shell; then
    # Some programs (e.g. remote shells started by scp) may invoke .bashrc in a
    # non-interactive shell
    # see https://unix.stackexchange.com/questions/257571/why-does-bashrc-check-whether-the-current-shell-is-interactive
    return 0
fi

############################################################################
# Enviornment conifguration

# Set configuration file for non-interactive shells
if [ -f ~/LexEnv/dot.bash_env ]; then
    export BASH_ENV="~/LexEnv/dot.bash_env"
fi

# Enable 256-color terminal
if [ -e /usr/share/terminfo/*/xterm-256color ]; then
    # Tell programs the current terminal supports xterm's 256 color palette
    # Works even if current terminal is not xterm
    export TERM='xterm-256color'
fi
# Make color output default for bash commands
# - 'ls'
# FreeBSD and MacOSX uses CLICOLOR and LSCOLOR. Linux uses LS_COLOR
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad # Dark color scheme
eval $(dircolors ~/LexEnv/dircolors/dircolors.ansi-universal)
#export LS_COLORS=
# - 'grep'
export GREP_OPTIONS='--color=auto'

# Change Prompt
export PS1="\$([ \$? -eq 0 ] && echo ${fmt_green} || echo ${fmt_red})________________________________________________________________________________${fmt_reset}\n\
| ${fmt_grey}\w ${fmt_reset}(${fmt_cyan}\$(parse_git_branch)${fmt_reset}) @ ${fmt_yellow}\h${fmt_reset})\n\
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
# Print path to file
pwdf() { echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"); }
# Verbose ls
alias ll='ls -FGlAhp'
 # Tally up occurances in output
alias tally='sort | uniq -c | sort -rn'
# Disk usage of folders/files in pwd
alias dupwd="du -h -d 0 .* *.* */ | sort -hr"

################################################################################
# Site specific configuration
if [ -f ~/LexEnv/local_bashrc.sh ]; then
    # Add symlink to include local profile (keep name convention below)
    source ~/LexEnv/local_bashrc.sh;
fi

################################################################################
export PATH=$(remove_path_duplicates "$PATH")
export PYTHONPATH=$(remove_path_duplicates "$PYTHONPATH")

################################################################################
# Print about completion if in interactive shell
print_shell_type
print_success "== Completed running .bashrc =="
