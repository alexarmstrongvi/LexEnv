###############################################################################
# Set Paths
export PATH="${PATH}:${HOME}/local/bin"

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
# Useful functions and aliases

################################################################################
e_success "== Completed running arete_am_bash_profile.sh =="