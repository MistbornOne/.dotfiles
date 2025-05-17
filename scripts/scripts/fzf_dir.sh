#!/bin/zsh

case "$1" in
  notes) target_dir="$HOME/Documents/Obsidian/" ;;
  scr) target_dir="$HOME/scripts/" ;;
  nvim) target_dir="$HOME/.config/nvim/" ;;
  dot) target_dir="$HOME/.dotfiles/" ;;
  dev) target_dir="$HOME/dev/" ;;
  projects) target_dir="$HOME/dev/github/MistbornOne/projects/" ;;
  blog) target_dir="$HOME/dev/github/MistbornOne/blog/ian-watkins/" ;;
  *) echo "Unknown Shorcut:" $1; exit 1 ;;
esac

# Choose file or directory
selection=$(fd . "$target_dir" | fzf --height=80% --layout=default --border --preview "bat --style=numbers --color=always {} || head {}")

# Exit if nothing was selected
[[ -z "$selection" ]] && exit 0

# If directory open in nvim with nvim tree
if [[ -d "$selection" ]]; then
  nvim "$selection" -c "NvimTreeOpen"
else
  nvim "$selection"
fi

