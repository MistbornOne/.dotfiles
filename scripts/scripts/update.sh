#!/bin/bash

echo "🔄 Updating dotfiles..."

cd ~/.dotfiles || exit 1

# Pull latest changes
git pull origin main

# (Optional) Re-stow everything in case new folders were added

echo "⌫ Deleting DS_Store files"
find . -name ".DS_Store" -delete

echo "📦 Restowing packages..."
stow --restow */

echo "✅ Done!"

