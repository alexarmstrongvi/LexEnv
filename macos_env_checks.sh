conda update conda
conda update --all
conda clean --all
# Repeat in each environment

brew update # sync base of available packages and versions
brew upgrade # install upgrades
brew cleanup --prune=1 -s
brew doctor
brew missing

