################################################################################
# Configure login Z shells
################################################################################

# Include any interactive login bash shell configuration
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi

print_success "== Completed running .zprofile =="
