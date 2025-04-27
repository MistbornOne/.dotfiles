#!/bin/zsh

# Check if you're in a Git repo
if [ ! -d .git]; then
  echo "🚫 Not inside a Git repo!"
  exit 1

fi

# Auto stash local edits
git stash save "Auto-sync stash $(date)"

# Pull remote changes
git pull origin main

# Apply stashed changes
git stash pop || true

# Check for unstaged or uncommitted changes locally
if [[ -n $(git status --porcelain) ]]; then
  echo "🤔 You have unstaged or uncommited changes."

  read -p "Would you like to add and commit them before pushing? (y/n): " answer
  echo $answer

  if [[ "$answer" == "y" ]]; then
    git add .
    read -p "Enter a commit message: " commit_msg
    git commit -m "${commit_msg:-Auto-sync commit $(date)}"
  else
    echo "🚫 Skipping local commit."
  fi
else
  echo "✅ No changes to commit."
fi


# Push local changes to remote
git push origin main
