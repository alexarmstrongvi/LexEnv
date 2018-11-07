################################################################################
# Set Paths
PATH=$PATH:$HOME/LexTools/
export PATH

#PYTHONPATH=$PYTHONPATH:/home/alarmstr/.local/lib
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

