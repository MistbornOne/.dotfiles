#!/bin/zsh

BEAR_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/bear/
COFFEE_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/coffee_commits/
DEV_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/ian-watkins/
TERM_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/terminal/
STORY_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/stories/
OBSIDIAN_PATH=/Users/ianwatkins/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/blog

if ! command -v gum &> /dev/null; then
    echo "gum is not installed. Please install it first."
    exit 1
fi

echo "$(gum style --foreground \#b48ead "Which site?:")"
site_type=$(gum choose --height 5 "Bear" "Coffee & Commits" "Ian-Watkins" "Terminal" "Stories")

echo "$(gum style --foreground \#b48ead "Sync GitHub?")"
  sync_github=$(gum choose --height 2 "yes" "no")

if [[ $site_type == "Bear" ]]; then
    blog_path=$BEAR_BLOG_PATH
elif [[ $site_type == "Coffee & Commits" ]]; then
    blog_path=$COFFEE_BLOG_PATH
elif [[ $site_type == "Ian-Watkins" ]]; then
    blog_path=$DEV_BLOG_PATH
elif [[ $site_type == "Terminal" ]]; then
    blog_path=$TERM_BLOG_PATH
elif [[ $site_type == "Stories" ]]; then
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
