#!/bin/zsh

BEAR_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/bear/
DEV_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/ian-watkins/
TERM_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/terminal/
STORY_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/stories/
OBSIDIAN_PATH=/Users/ianwatkins/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/blog

if ! command -v gum &> /dev/null; then
    echo "gum is not installed. Please install it first."
    exit 1
fi

echo "$(gum style --foreground \#b48ead "Which site?:")"
site_type=$(gum choose --height 4 "bear" "ian-watkins" "terminal" "stories")

echo "$(gum style --foreground \#b48ead "Sync GitHub?")"
  sync_github=$(gum choose --height 2 "yes" "no")

if [[ $site_type == "bear" ]]; then
    blog_path=$BEAR_BLOG_PATH
elif [[ $site_type == "ian-watkins" ]]; then
    blog_path=$DEV_BLOG_PATH
elif [[ $site_type == "terminal" ]]; then
    blog_path=$TERM_BLOG_PATH
elif [[ $site_type == "stories" ]]; then
    blog_path=$STORY_BLOG_PATH
else
    echo "Invalid selection."
    exit 1
fi

if [[ $sync_github == "yes" ]]; then
    cd $blog_path || exit 1
    echo "Syncing GitHub..."
    git pull origin main
    echo "✅ GitHub sync complete."
    
  else
    echo "Skipping GitHub sync."
    cd $blog_path
fi
