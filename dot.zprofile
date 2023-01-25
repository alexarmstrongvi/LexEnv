################################################################################
# Configure interactive login Z shells
################################################################################

# Include any interative login bash shell configuration
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi

# Include any non-login Z shell configuration
if [ -f ~/.zshrc ]; then
    . ~/.zshrc;
fi

e_success "== Completed running .zprofile =="