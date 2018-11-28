//#include "AtlasStyle.C" 
//#include "AtlasUtils.C" 
//#include "AtlasLabels.C"
// For python:
// import ROOT; import AtlasStyle 

void rootlogon()
{
  printf("Loading user root configuration script...\n");
  if (getenv("ROOTCOREDIR")) {
      printf("Loading RootCore packages\n");
      gROOT->ProcessLine(".x $ROOTCOREDIR/scripts/load_packages.C");
      // To do this in python, include the following
      // r.gROOT.ProcessLine(".x ${ROOTCOREDIR}/scripts/load_packages.C”)
  }
  
  // Load ATLAS style
  //gROOT->LoadMacro("AtlasStyle.C"); //No longer works for ROOT6
  //printf("Loading ATLAS Style settings for plots...\n");
  //SetAtlasStyle();
  
  printf("Done loading scripts\n");
}
