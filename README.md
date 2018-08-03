# LexEnv

## How to use

To use these files, a symlink must be set in the appropriate place

Special cases    
* `.gitconfig` - add into the `~/.gitconfig` under an `[include]` heading as `~/LexEnv/.gitconfig` (see [here](https://stackoverflow.com/questions/1557183/is-it-possible-to-include-a-file-in-your-gitconfig))
* `local_bash_profile.sh` - contains any site specific configurations. Add a symlink called `local_bash_profile.sh` to any such file and it will be picked up by `.bash_profile`

