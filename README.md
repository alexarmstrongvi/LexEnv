LexEnv
============
My environment configuration files

# Setup

## Linux/MacOS Setup
```bash
cd ${HOME}
git clone --recurse-submodules git@github.com:alexarmstrongvi/LexEnv.git
cd LexEnv
./install
```

To uninstall symlinks at anypoint, run `~/LexEnv/uninstall`

Special cases  
* `local_bashrc.sh` - contains any site specific configurations. Add a symlink
  inside `~/.local/bin/` called `local_bashrc.sh` that points to any shell
  script and it will be run by `.bashrc`:

## Windows Setup
TODO

## Neovim Setup

1. Install Neovim
1. Clone Packer plugin manager
1. run PackerSync

## Python Setup

If the default python version is not sufficient, install python (pip should be
part of the python package). The latest python versions can be found on the
[python website](https://www.python.org/downloads/)

If you do not have root access on the machine follow
[these](http://thelazylog.com/install-python-as-local-user-on-linux/)
instructions to install python. I prefer to use `--prefix ${HOME}/.local/lib/`
as the location for all locally installed libraries. 

### Anaconda Setup

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
cd ${HOME}/.vim/colors/
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
```

## Other notes

Setting up the symlinks may not be possible if there is already an environment
configuration file that exists. In this case merge the current file with the
LexEnv file, delete the current file, and replace with a symlink.

Calling the right binary from the terminal may require resetting the binary hash
table (`hash -r`) to force the terminal to look through the PATH again instead
of calling previous binaries. This problem crops up when the `which` command
returns the path to a different binary than the one called when you enter the
command into the command line (e.g. `python` != `./$(which python)`)

# Background Notes
## Shells
A shell is an intepreter program that processes input from users or other
programs and executes commands on the OS kernal
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

