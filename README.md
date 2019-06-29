LexEnv
============

# Setup
Below is all the commands needed for the full environment setup. 
Feel free to pick and choose which elements are needed for your particular use case.

**General Setup**
```bash
cd ${HOME}
git clone git@github.com:alexarmstrongvi/LexEnv.git
ln -s ${HOME}/LexEnv/dot.bash_profile .bash_profile
ln -s ${HOME}/LexEnv/dot.vimrc .vimrc 
ln -s ${HOME}/LexEnv/dot.gitignore .gitignore
ln -s ${HOME}/LexEnv/dot.tmux.conf .tmux.conf
```
Special cases  
* `local_bash_profile.sh` - contains any site specific configurations. Add a symlink inside `LexEnv/` called `local_bash_profile.sh` that points to any a .sh file and it will be picked up by [`dot.bash_profile`](dot.bash_profile)
* `.gitconfig` - edit `~/.gitconfig` to include the code snippet below:
  * `${HOME}` needs to be written in expanded form in the `.gitconfig` file as it will not be expanded automatically
  * see [stackoverflow](https://stackoverflow.com/questions/1557183/is-it-possible-to-include-a-file-in-your-gitconfig) for info on using `[include]`
```bash
[include]
    path = ${HOME}/LexEnv/dot.gitconfig
```
  
**ROOT Setup**
```bash
ln -s ${HOME}/LexEnv/dot.rootrc .rootrc
git clone https://gitlab.cern.ch/alarmstr/atlasrootstyle
cd LexEnv/RootUtils
./setup_style_links.sh ${HOME}/atlasrootstyle
```

**Other notes**
Setting up the symlinks may not be possible if there is already a environment configuration file that exists.
In this case merge the current file with the LexEnv file, delete the current file, and replace with a symlink.

