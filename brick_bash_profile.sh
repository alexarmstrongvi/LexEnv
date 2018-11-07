################################################################################
# Set Paths
# Check if still need to explicitely define path to avoid erros
#PATH=/usr/lib64/qt-3.3/bin
#PATH=$PATH:/usr/local/bin
#PATH=$PATH:/bin
#PATH=$PATH:/usr/bin
#PATH=$PATH:/usr/local/sbin
#PATH=$PATH:/sbin
#PATH=$PATH:$HOME/bin
#PATH=$PATH:$HOME/.local/bin
#PATH=$PATH:$HOME/.local/lib/python2.7/site-packages
PATH=$PATH:$HOME/LexTools/
export PATH

#PYTHONPATH=$PYTHONPATH:/data/home/alarmstr/.local/lib/python2.7/site-packages
PYTHONPATH=$PYTHONPATH:/home/alarmstr/.local/lib
PYTHONPATH=$PYTHONPATH:$HOME/LexTools
export PYTHONPATH


################################################################################
# Environment Configuration
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
export USER='alarmstr'

# Dont write .pyc files
#export PYTHONDONTWRITEBYTECODE=1

################################################################################
# Useful functions and aliases
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
alias vomsAtlas='voms-proxy-init -voms atlas -valid 96:00'
alias kcern='kinit -f $USER@CERN.CH'
alias condor_ls='condor_q -nobatch | head; echo ...; condor_q -nobatch | grep -v 0+00:00:00 | tail; printf "Started but idle jobs : "; condor_q -nobatch | grep -v 0+00:00:00 | grep " I " | wc -l;'

# Includes (must come after defining PATH variables)
source ~/LexTools/bashTools.sh
remove_PATH_duplicates

