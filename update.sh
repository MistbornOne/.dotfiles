#!/bin/bash

echo "🔄 Updating dotfiles..."

cd ~/.dotfiles || exit 1

# Pull latest changes
git pull origin main

# (Optional) Re-stow everything in case new folders were added
echo "📦 Restowing packages..."
stow --restow */

echo "✅ Done!"

