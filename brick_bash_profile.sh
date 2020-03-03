################################################################################
# Set Paths
PATH=$HOME/.local/bin/:$PATH
PATH=$PATH:$HOME/LexTools/
export PATH

PYTHONPATH=$PYTHONPATH:/home/alarmstr/.local/lib
PYTHONPATH=$PYTHONPATH:$HOME/LexTools
export PYTHONPATH


################################################################################
# Environment Configuration
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
export ALRB_rootVersion=6.12.06-x86_64-slc6-gcc62-opt
export USER='alarmstr'

export JODIR='/cvmfs/atlas.cern.ch/repo/sw/Generators/MC15JobOptions/'
export DEVDIR='/cvmfs/atlas.cern.ch/repo/sw/database/GroupData/dev/'
# Dont write .pyc files
#export PYTHONDONTWRITEBYTECODE=1

################################################################################
# Useful functions and aliases
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
alias vomsAtlas='voms-proxy-init -voms atlas -valid 96:00'
alias kcern='kinit -f $USER@CERN.CH'
alias condor_ls='condor_q -nobatch | grep -v " X " | head; echo ...; condor_q -nobatch | grep -v 0+00:00:00 | tail; printf "Started but idle jobs : "; condor_q -nobatch | grep -v 0+00:00:00 | grep " I " | wc -l;'
alias activateVenvPy2='source /data/uclhc/uci/user/armstro1/.venv/LexBasePy2/bin/activate'
alias activateVenvPy3='source /data/uclhc/uci/user/armstro1/.venv/LexBasePy3/bin/activate'

function atlas_sw () {
    full_ver=$1
    short_ver=$(echo $full_ver | grep -o ^[0-9]*.[0-9]*)
    echo "/cvmfs/atlas.cern.ch/repo/sw/software/${short_ver}/AnalysisBase/${full_ver}/InstallArea/*"
}
# Includes (must come after defining PATH variables)
source ~/LexTools/bashTools.sh
remove_PATH_duplicates

