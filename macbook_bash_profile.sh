###############################################################################
#   Set Paths
PATH="/usr/local/bin:$PATH"
PATH="/usr/X11/bin:$PATH"
PATH="//anaconda/bin:$PATH"  # added by Anaconda3 4.2.0 installer
PATH="/Users/alexarmstrong/anaconda3/bin:$PATH"  # added by Anaconda3 5.0.1 installer
PATH="~/LexTools/:$PATH"  # added by Anaconda3 5.0.1 installer
export PATH

################################################################################
# Useful functions and aliases
sshlx() { ssh -Y alarmstr@lxplus${1}.cern.ch; }

setupROOT6() { . /Applications/root_v6.14.00/bin/thisroot.sh; }


# Includes (must come after defining PATH variables)
source bashTools.sh
remove_PATH_duplicates
