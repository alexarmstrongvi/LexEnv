if [ -f ~/.bashrc ]; then
    . ~/.bashrc;
fi

################################################################################
# Print about completion if in interative shell
if [[ $- == *i* ]]; then
    green="$(tput setaf 2)"
    reset="$(tput sgr0)"
    printf "${green}✔ == Completed running .zshrc ==${reset}\n"
fi