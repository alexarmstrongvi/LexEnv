LexEnv
============

# Setup
Below is all the commands needed for the full environment setup. 
Feel free to pick and choose which elements are needed for your particular use case.

## General Setup
```bash
cd ${HOME}
git clone git@github.com:alexarmstrongvi/LexEnv.git
for f in LexEnv/dot.*; do bn=$(basename $f); ln -s $f ${bn#dot}; done
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

## Python Setup

If the default python version is not sufficient, install python (pip should be part of the python package).
The latest python versions can be found on the [python website](https://www.python.org/downloads/)

If you do not have root access on the machine follow [these](http://thelazylog.com/install-python-as-local-user-on-linux/) instructions to install python. I prefer to use `--prefix ${HOME}/.local/lib/` as the location for all locally installed libraries with `${HOME}/.local/bin/` as the location for binaries or symlinks to binaries.

Install viritualenv and virtualenvwrapper, expecially if you don't have root access on the machine, before installing any other packages. Follow the [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) Docs to setup a base environment for your desired python 2 and python 3 versions. I usually add numpy and pandas to both of these to make sure everything is working and because I use those packages all the time.
## Anaconda Setup

Download installer from webpage.

Check everything is up to date
```bash
conda update conda
conda update --all
conda clean --all
```

## Installing bash packages without root access

See [link](https://monsterbashseq.wordpress.com/2016/01/24/how-to-install-linux-software-without-root-privileges/)

## Updating Packages

JellyBeans vim color scheme
```bash
cd ${HOME}/LexEnv/dot.vim/colors/
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
```

## Other notes

Setting up the symlinks may not be possible if there is already a environment configuration file that exists.
In this case merge the current file with the LexEnv file, delete the current file, and replace with a symlink.

Calling the right binary from the terminal may require resetting the binary hash table (`hash -r`) to force the terminal to look through the PATH again instead of calling previous binaries. This problem crops up when the `which` command returns the path to a different binary than the one called when you enter the command into the command line (e.g. `python` != `./$(which python)`)

# Background Notes
## Shells
A shell is an intepreter program that processes input from users or other programs and executes commands on the OS kernal
* Examples of Shells
  * UNIX: Bourne-again shell (Bash) and Z shell (Zsh)
  * Windows: Command shell
* Shell vs Terminal, Console, Interpreter, etc...
  * **Terminal** - Any interface, physical or virtual, that accepts text input, passes it to programs for processing, and returns text output.
    * **Console** - physical terminal (e.g. keyboard, screen, printer)
    * **Terminal window/emulator** - text-only GUI
      * e.g. Mac Terminal, Xterm, Screen, SSH, Expect
      * **Command Line Interface** (CLI) - Portion of the GUI where users interactively enter, edit, and submit macros or commands
    * TeleTYpewriter (**tty**) - a UNIX implementation of virtual terminals via device files
  * Programs processing and running commands
    * **Interpreter** - program for processing uncompiled computer instructions of a given language and running them on a target machine
    * **Shell** - type of interpreter (see above def)
      * Interactive vs Non-Interactive shell
      * Login vs Non-Login shell
    * **Command language** - any programming language that can be interpreted by the shell (a.k.a. command line interpreter)
    * **Kernal** - central program in an OS that has complete control over the system and is the interface of all applications with the hardware
  * Things that run
    * Process
    * Pipeline
    * Job
    * Thread
    * Task

