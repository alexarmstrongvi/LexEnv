################################################################################
# Configure interactive login bash shells
################################################################################
source ~/LexEnv/bash_utils.sh
# Include interactive non-login shell configurations
if is_interactive_shell && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Site specific configuration
if [ -f ~/LexEnv/local_bash_profile.sh ]; then
    # Add symlink to include local profile (keep name convention below)
    source ~/LexEnv/local_bash_profile.sh;
fi

print_success "== Completed running .bash_profile =="
