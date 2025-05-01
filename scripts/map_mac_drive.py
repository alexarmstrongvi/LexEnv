#!/usr/bin/env python
from pathlib import Path
import json
from typing import Callable, Any

# Constants
UNIX_STD_DIRS = (
    # This pattern of folders occurs in many places in a unix system
    # - /
    # - /usr/
    # - /opt/local
    'bin',     # Binaries
    'sbin',    # System binaries
    'lib',     # Libraries for binaries
    'libexec', # Libraries for executable programs
    'share',   # Read-only architecture independent data files
    'include', #
    'etc',     # Program configuration files
    'var',     #
    'tmp',     # Temporary files often cleared during reboot
)
# Type aliases
DirMap =  str | list[Any] | dict[str, Any]
MapFunc = Callable[[Path, str], DirMap]
def main():
    drive = apply_map(Path('/'), map_root)
    #ostr = pprint.pformat(drive, indent=2, width=1000, compact=False)
    ostr = json.dumps(drive, indent=2)
    Path('./mac_drive_map_new.json').write_text(ostr)

################################################################################
# Directory specific mapping functions
def map_root(path: Path, pname: str) -> DirMap:
    '''Map the root directory of a mac'''
    #############################
    # UNIX folders
    # see https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
    if path.name in UNIX_STD_DIRS:
        return ls(path)
    elif path.name == 'opt': # 3rd party packages
        return apply_map(path, map_opt)
    elif path.name == 'dev': # Device files
        return apply_map(path, map_dev)
    elif path.name == 'home':
        # Unused on MacOS. Should be empty
        return ls(path)
    elif path.name == 'usr': # Read-only all-user data, utilities, and applications
        return apply_map(path, map_usr)
    #############################
    # MacOS folders
    elif path.name == 'Applications':
        return ls(path)
    elif path.name == 'Library':
        return ls(path)
    elif path.name == 'System':
        return apply_map(path, map_System)
    elif path.name == 'Users':
        return apply_map(path, map_Users)
    elif path.name == 'Volumes':
        return ls(path)
    elif path.name == 'private':
        return apply_map(path, map_private)
    elif path.name == 'cores': # Core dumps for developer testing
        return ls(path)
    #############################
    # Other
    elif path.name == '.VolumeIcon.icns': # Image for volume icon
        return pname
    elif path.name == '.vol':
        return pname
    elif path.name == '.file':
        return pname
    print('TODO ::', path)
    return pname

def map_std_unix_dirs(path: Path, pname: str) -> DirMap:
    if path.name in UNIX_STD_DIRS:
        return ls(path)
    return pname

#############################
# UNIX folders
def map_opt(path: Path, pname: str) -> DirMap:
    if path.name == 'local':
        return apply_map(path, map_std_unix_dirs)
    elif path.name == 'homebrew':
        return apply_map(path, map_homebrew)
    return pname

def map_usr(path: Path, pname: str) -> DirMap:
    #####################
    # UNIX folders
    if path.name in UNIX_STD_DIRS:
        return ls(path)
    if path.name == 'bin': # Non-essential all-user binaries
        return ls(path)
    elif path.name == 'sbin': # Non-essential system binaries
        return ls(path)
    elif path.name == 'lib': # Libraries for user binaries
        return ls(path)
    elif path.name == 'libexec': # Executables intended for library use as opposed to users
        return ls(path)
    elif path.name == 'local': # Host-specific user data, utilities, and applications
        return apply_map(path, map_usr_local)
    elif path.name == 'share': # Read-only architecture independent data files
        return ls(path)
    #####################
    # MacOS folders
    elif path.name == 'standalone':
        return ls(path)
    return pname

def map_usr_local(path: Path, pname: str) -> DirMap:
    #####################
    # UNIX folders
    if path.name == 'bin': # Non-essential host-specific binaries
        return ls(path)
    elif path.name == 'sbin': # Non-essential binaries for host system
        return ls(path)
    elif path.name == 'lib': # Libraries for user binaries
        return ls(path)
    elif path.name == 'libexec': # Executables intended for library use as opposed to users
        return ls(path)
    elif path.name == 'share': # Read-only architecture independent data files
        return ls(path)
    elif path.name == 'include':
        return ls(path)
    elif path.name == 'opt':
        return ls(path)
    elif path.name == 'etc':
        return ls(path)
    elif path.name == 'var':
        return ls(path)
    #####################
    # Mac Homebrew package manager
    # Homebrew prefers everything in /usr/local to be under it's control but
    # many packages will install files here if you are not careful.
    elif path.name == 'Homebrew':
        return ls(path)
    elif path.name == 'Cellar':
        return ls(path)
    elif path.name == 'Caskroom':
        return ls(path)
    return pname

def map_dev(path: Path, pname: str) -> DirMap:
    if path.name == 'fd': # File descriptors (e.g. stdout, stderr, etc.)
        return ls(path)
    return pname

def map_private(path: Path, pname: str) -> DirMap:
    if path.name == 'etc':
        return ls(path)
    elif path.name == 'tmp':
        return ls(path)
    elif path.name == 'var':
        return ls(path)
    return pname

#############################
# MacOS folders
def map_Users(path: Path, pname: str) -> DirMap:
    if path.name == 'Guest':
        return ls(path)
    elif path.name == 'Shared':
        return ls(path)
    elif path == Path.home():
        return apply_map(path, map_Users_home)
    return pname

def map_Users_home(path: Path, pname: str) -> DirMap:
    if path.name == 'Documents':
        return ls(path)
    elif path.name == 'Movies':
        return ls(path)
    elif path.name == 'Pictures':
        return ls(path)
    elif path.name == 'Public':
        return ls(path)
    elif path.name == 'Library':
        return apply_map(path, map_Users_home_Library)
    elif path.name == '.local':
        return apply_map(path, map_Users_home_local)
    return pname

def map_Users_home_Library(path: Path, pname: str) -> DirMap:
    if path.name == 'CloudStorage':
        return ls(path)
    return pname

def map_Users_home_local(path: Path, pname: str) -> DirMap:
    if path.name == 'share':
        return ls(path)
    if path.name == 'state':
        return ls(path)
    return pname

def map_System(path: Path, pname: str) -> DirMap:
    if path.name == 'Applications':
        return ls(path)
    elif path.name == 'Library':
        return ls(path)
    elif path.name == 'Volumes':
        return ls(path)
    return pname

def map_homebrew(path: Path, pname: str) -> DirMap:
    if path.name in UNIX_STD_DIRS:
        return ls(path)
    elif path.name == 'Caskroom':
        return ls(path)
    elif path.name == 'Cellar':
        return ls(path)
    elif path.name == 'Frameworks':
        return ls(path)
    elif path.name == 'Library':
        return ls(path)
    elif path.name == 'opt':
        return ls(path)
    elif path.name == 'package':
        return ls(path)
    elif path.name == 'completions':
        return ls(path)
    elif path.name == 'docs':
        return ls(path)
    elif path.name == 'manpages':
        return ls(path)
    return pname

################################################################################
# Helper functions
def ls(path: Path) -> DirMap:
    pname = to_str(path)
    if is_file(path) or path.is_symlink():
        return pname
    return {pname : [to_str(p) for p in iterdir(path)]}

def to_str(path: Path, absolute=False) -> str:
    name = str(path) if absolute else path.name
    if is_dir(path):
        name += '/'
    if path.is_symlink():
        name += ' -> ' + to_str(path.readlink(), absolute=True)
    return name

def iterdir(path: Path):
    """Iterate directories and then files inside the provided directory"""
    return iterdirs(path) + iterfiles(path)

def iterdirs(path: Path) -> list[Path]:
    return sorted(p for p in path.iterdir() if is_dir(p))

def iterfiles(path: Path) -> list[Path]:
    return sorted(p for p in path.iterdir() if not is_dir(p))

# Wrap is_dir and is_file methods to catch permission errors when attempting
# path.stat() on system paths. Assume such paths are files
def is_dir(path: Path):
    try:
        return path.is_dir()
    except PermissionError:
        return False

def is_file(path: Path):
    try:
        return path.is_file()
    except PermissionError:
        return True

def apply_map(top_path: Path, map_func: MapFunc) -> DirMap:
    '''Build directory map, applying mapping function to any folders'''
    folder = []
    for path in iterdir(top_path):
        pname = to_str(path)
        if is_file(path) or path.is_symlink():
            dirmap = pname
        else:
            dirmap = map_func(path, pname)
        folder.append(dirmap)
    if top_path == Path('/'):
        return folder
    return {to_str(top_path) : folder}

if __name__ == '__main__':
    main()
