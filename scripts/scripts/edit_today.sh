#!/bin/zsh

NOTE_DIR="$HOME/Documents/Obsidian/Work/Daily/"
FILENAME="$(DATE +%Y-%m-%d).md"

nvim "$NOTE_DIR/$FILENAME"
