################################################################################
# Configure interactive Z shells
################################################################################

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc;
fi

# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP
# Keep emacs style command line editing
bindkey -e

# Change Prompt
setopt PROMPT_SUBST
source $HOME/.zsh/zsh-git-prompt/zshrc.sh
PROMPT='%F{$([ $? = 0 ] && echo green || echo red)}________________________________________________________________________________%f
|%B%d%b $(git_super_status)
| => '

autoload -U compinit
compinit

# Plugins
if [ -d $HOME/.zsh/zsh-autosuggestions ]; then
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# if [ -d ${HOME}/.zsh/zsh-autocomplete ]; then
#     source ${HOME}/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# fi
eval "$(zoxide init zsh)"

################################################################################
print_success "== Completed running .zshrc =="
