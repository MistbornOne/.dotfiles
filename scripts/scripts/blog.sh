#!/bin/zsh

DEV_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/ian-watkins/
TERM_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/terminal/
STORY_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/stories/

if ! command -v gum &> /dev/null; then
    echo "gum is not installed. Please install it first."
    exit 1
fi

echo "$(gum style --foreground \#cba6f7 "Which site?:")"
site_type=$(gum choose --height 3 "ian-watkins" "terminal" "stories")

echo "$(gum style --foreground \#cba6f7 "Sync GitHub?")"
  sync_github=$(gum choose --height 2 "yes" "no")

if [[ $site_type == "ian-watkins" ]]; then
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
