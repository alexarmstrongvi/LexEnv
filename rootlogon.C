{
    printf("Loading user root configuration script...\n");
    if (getenv("ROOTCOREDIR")) {
        printf("Loading RootCore packages\n");
        gROOT->ProcessLine(".x $ROOTCOREDIR/scripts/load_packages.C");
    }
    printf("Done loading scripts\n");
}
