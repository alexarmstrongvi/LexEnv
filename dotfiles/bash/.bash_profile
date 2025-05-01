#!/usr/bin/env bash
################################################################################
# Configure interactive login bash shells
################################################################################
source $HOME/.local/lib/bash_utils.sh
# Include interactive non-login shell configurations
if is_interactive_shell && [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Site specific configuration
local_bash_profile_path=$HOME/.local/bin/local_bash_profile.sh 
if [ -f $local_bash_profile_path ]; then
    # Add symlink to include local profile (keep name convention below)
    source $local_bash_profile_path
fi

print_success "== Completed running .bash_profile =="
