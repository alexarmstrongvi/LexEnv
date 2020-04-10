################################################################################
# Set Paths
PATH=$PATH:$HOME/bin

PATH=$HOME/.local/bin/:$PATH
PATH=$PATH:$HOME/LexTools/
export PATH

if [ -z $PYTHONPATH ]; then
    PYTHONPATH=$PYTHONPATH:/home/alarmstr/.local/lib
else
    PYTHONPATH=/home/alarmstr/.local/lib
fi
PYTHONPATH=$PYTHONPATH:$HOME/LexTools
export PYTHONPATH


################################################################################
# Environment Configuration
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
#export ALRB_rootVersion=6.12.06-x86_64-slc6-gcc62-opt
export USER='alarmstr'
export DISPLAY=''

export JODIR='/cvmfs/atlas.cern.ch/repo/sw/Generators/MC15JobOptions/'
export DEVDIR='/cvmfs/atlas.cern.ch/repo/sw/database/GroupData/dev/'
# Dont write .pyc files
#export PYTHONDONTWRITEBYTECODE=1

################################################################################
# Useful functions and aliases
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
alias vomsAtlas='voms-proxy-init -voms atlas -valid 96:00'
alias kcern='kinit -f $USER@CERN.CH'
#alias activateVenvPy2='source /data/uclhc/uci/user/armstro1/.venv/LexBasePy2/bin/activate'
#alias activateVenvPy3='source /data/uclhc/uci/user/armstro1/.venv/LexBasePy3/bin/activate'

function condor_ls () {
    if [ -z "$1" ]; then
        NPRINT=10;
    else
        NPRINT=$1
    fi
    condor_q -nobatch | grep -v " X " | head -n $NPRINT
    echo -e "\n\t...\n"
    condor_q -nobatch | grep -v 0+00:00:00 | tail -n $NPRINT
    printf "Started but idle jobs : "; condor_q -nobatch | grep -v 0+00:00:00 | grep " I " | wc -l
}
function condor_ls2 () {
    if [ -z "$1" ]; then
        NPRINT=3;
    else
        NPRINT=$1
    fi
    condor_q -nobatch -wide | grep -v " X " | head -n $((4+$NPRINT)) | sed 's/\ \ */\ /g' | sed 's/\ /\n\t/g9'
}
function condor_ls3 () {
    if [ -z "$1" ]; then
        NPRINT=1;
    else
        NPRINT=$1
    fi
    condor_q -nobatch -wide | grep -v " X " | head -n $((4+$NPRINT)) | sed 's/\ \ */\ /g' | sed 's/\ /\n\t/g9'
    echo -e "\n\t...\n"
    condor_q -nobatch -wide | grep -v " X " | tail -n $((2+$NPRINT)) | head -n $NPRINT | sed 's/\ \ */\ /g' | sed 's/\ /\n\t/g9'
    condor_q -nobatch -wide | tail -n 2
    printf "Started but idle jobs : "; condor_q -nobatch | grep -v 0+00:00:00 | grep " I " | wc -l;
}

function atlas_sw () {
    full_ver=$1
    short_ver=$(echo $full_ver | grep -o ^[0-9]*.[0-9]*)
    echo "/cvmfs/atlas.cern.ch/repo/sw/software/${short_ver}/AnalysisBase/${full_ver}/InstallArea/*"
}
# Includes (must come after defining PATH variables)
source ~/LexTools/bashTools.sh
remove_PATH_duplicates
remove_PYTHONPATH_duplicates

#eval "$(ssh-agent -s)";
#ssh-add ~/.ssh/id_rsa;
