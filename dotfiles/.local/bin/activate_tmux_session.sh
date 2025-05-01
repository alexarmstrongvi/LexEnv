# Add all subfolders in specific folders
folders="$(find ${MY_PROJECT_DIRS-~} \
    -maxdepth 1 -mindepth 1 \
    -type d \
    -regex '.*/[^.][^/]*' \
)"
selected="$(echo $folders | sed 's/ /\n/g' | fzf)"

# If no folders were selected, then exit
if [ -z "$selected" ]; then
    exit 0
fi

selected_name="$(basename $selected)"
tmux_is_running="$(pgrep tmux)"
inside_tmux="$TMUX"

# If tmux is not running, create new session for selected folder
if [ -z "$tmux_is_running" ]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

# If tmux is running but a session for this folder does not exist, create it but
# do not attach to it yet
if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    tmux new-session -d -s "$selected_name" -c "$selected"
fi

# Attach to tmux session
if [ -z "$inside_tmux" ]; then
    tmux attach-session -t "$selected_name"
else
    tmux switch-client -t "$selected_name"
fi
