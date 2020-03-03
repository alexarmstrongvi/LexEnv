###############################################################################
#   Set Paths
PATH="/usr/local/bin:$PATH"
PATH="~/local/bin:$PATH"
PATH="/opt/X11/bin:$PATH"
PATH="/Users/alexarmstrong/anaconda3/bin:$PATH"  # added by Anaconda3 5.0.1 installer
PATH="~/LexTools/:$PATH"
export PATH

################################################################################
# Useful functions and aliases
sshlx() { ssh -Y alarmstr@lxplus${1}.cern.ch; }

setupROOT6() { . /usr/local/lib/root_v6.14.00/bin/thisroot.sh; }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alexarmstrong/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alexarmstrong/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alexarmstrong/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alexarmstrong/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Includes (must come after defiing PATH variables)
source bashTools.sh
remove_PATH_duplicates
