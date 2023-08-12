# Add all subfolders in specific folders
folders="$(find \
    ~ \
    ~/MyDocuments/Coding \
    ~/MyDocuments/Coding/Tutorials \
    ~/MyDocuments/Coding/Tutorials/Python \
    -type d -maxdepth 1 -mindepth 1 \
    -regex '.*/[^.][^/]*' \
)"
selected="$(echo $folders | sed 's/ /\n/g' | fzf)"

find ~ ~/MyDocuments/Coding ~/MyDocuments/Coding/Tutorials ~/MyDocuments/Coding/Tutorials/Python -type d -maxdepth 1 -mindepth 1
# If no folders were selected, then exit
if [ -z "$selected" ]; then
    exit 0
fi

selected_name="$(basename $selected)"
tmux_is_running="$(pgrep tmux)"

# If tmux is not running, create new session for selected folder
if [ -z "$TMUX" ] && [ -z "$tmux_is_running" ]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

# If tmux is running but a session for this folder does not exist, create it but
# do not attach to it
if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    tmux new-session -d -s "$selected_name" -c "$selected"
fi

# A tmux session for the folder already exists. Attach to it
tmux switch-client -t "$selected_name"
