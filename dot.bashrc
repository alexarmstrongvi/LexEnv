################################################################################
# Site specific

if [ -f ~/LexEnv/local_bashrc.sh ]; then
    # Add symlink to include local profile (keep name convention below)
    source ~/LexEnv/local_bashrc.sh;
fi

################################################################################
# Print about completion if in interative shell
if [[ $- == *i* ]]; then
    green="$(tput setaf 2)"
    reset="$(tput sgr0)"
    printf "${green}✔ == Completed running .bashrc ==${reset}\n"
fi
