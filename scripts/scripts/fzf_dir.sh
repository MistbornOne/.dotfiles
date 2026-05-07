#!/bin/zsh

case "$1" in
  notes) target_dir="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/LifeOS" ;;
  scr) target_dir="$HOME/scripts/" ;;
  nvim) target_dir="$HOME/.config/nvim/" ;;
  dot) target_dir="$HOME/.dotfiles/" ;;
  dev) target_dir="$HOME/dev/" ;;
  projects) target_dir="$HOME/dev/github/MistbornOne/projects/" ;;
  blog) target_dir="$HOME/dev/github/MistbornOne/blog/" ;;
  *) echo "Unknown Shorcut:" $1; exit 1 ;;
esac

# Choose file or directory
selection=$(fd . "$target_dir" | fzf --height=80% --layout=default --border --preview "bat --style=numbers --color=always {} || head {}")

# Exit if nothing was selected
[[ -z "$selection" ]] && exit 1

# Open with Helix and go to end of file
exec hx "$selection" 
