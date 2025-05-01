#!/bin/bash

if ! is_sourced; then
    echo "Error: This script must be sourced. Use 'source activate' or '. activate'"
    exit 1
fi

# Set VENV_ROOT based on OS
if is_mac; then
    VENV_ROOT="/Users/$USER/Library/venvs"
else
    # VENV_ROOT="$HOME/venvs"
    echo "Error: No virtual environment path configured for this system"
    return 1
fi

if [ $# -eq 0 ]; then
    if [ -d ".venv" ]; then
        source .venv/bin/activate
    else
        echo "Error: No .venv directory found in current path"
        return 1
    fi
else
    venv_path="$VENV_ROOT/$1"
    if [ -d "$venv_path" ]; then
        source "$venv_path/bin/activate"
    else
        echo "Error: Virtual environment '$1' not found in $VENV_ROOT"
        return 1
    fi
fi
