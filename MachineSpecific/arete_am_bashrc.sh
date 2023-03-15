################################################################################
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
    print_success "== Completed running /etc/bashrc =="
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Update PATH
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Load modules
module load git vim anaconda

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/2020.11/py3.8/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/2020.11/py3.8/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/2020.11/py3.8/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/2020.11/py3.8/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

################################################################################
print_success "== Completed running arete_am_bashrc.sh =="
