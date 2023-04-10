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
source ${HOME}/LexEnv/shell/zsh-git-prompt/zshrc.sh
PROMPT='%F{$([ $? = 0 ] && echo green || echo red)}________________________________________________________________________________%f
|%B%d%b $(git_super_status)
| => '

# Plugins
if [ -d ${HOME}/LexEnv/dot.zsh/zsh-autosuggestions ]; then
    source ~/LexEnv/dot.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# if [ -d ${HOME}/LexEnv/dot.zsh/zsh-autocomplete ]; then
#     source ~/LexEnv/dot.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# fi

################################################################################
print_success "== Completed running .zshrc =="
