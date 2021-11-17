###############################################################################
#   Set Paths
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="~/local/bin:$PATH"
PATH="/opt/X11/bin:$PATH"
PATH="/Users/alexarmstrong/anaconda3/bin:$PATH"  # added by Anaconda3 5.0.1 installer
PATH="~/LexTools/:$PATH"
export PATH

export LLVM_SRC_ROOT="${HOME}/local/lib/clang-10.0.0.src"

# PostgreSQL
export DATABASE_URL=postgres://$(whoami)

if type brew &>/dev/null; then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
            [[ -r "$COMPLETION" ]] && source "$COMPLETION"
        done
    fi
fi

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

# For Scala
# >>> coursier install directory >>> 
export PATH="$PATH:/Users/alexarmstrong/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# For Apache Spark
#export SPARK_HOME="/usr/local/Cellar/apache-spark/3.1.2/libexec"
#export PYTHONPATH="${PYTHONPATH}:${SPARK_HOME}/python"

################################################################################
# Useful functions and aliases
sshlx() { ssh -Y alarmstr@lxplus${1}.cern.ch; }

setupROOT6() { . /usr/local/lib/root_v6.14.00/bin/thisroot.sh; }

#alias gcolumn=/usr/local/opt/util-linux/bin/column

# Includes (must come after defiing PATH variables)
source bashTools.sh
remove_PATH_duplicates
