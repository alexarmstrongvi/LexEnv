################################################################################
# Configure interactive Z shells
################################################################################

if [ -f ~/.bashrc ]; then
    . ~/.bashrc;
fi

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP
# Keep emacs style command line editing
bindkey -e

# Change Prompt
setopt PROMPT_SUBST
PROMPT='%F{$([ $? = 0 ] && echo green || echo red)}________________________________________________________________________________%f
|%B%d%b (%F{yellow}$(parse_git_branch)%f)
| => '

################################################################################
print_success "== Completed running .zshrc =="
