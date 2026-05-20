#!/bin/zsh

MAIN_BLOG_PATH=/Users/ianwatkins/dev/github/MistbornOne/blog/ian_watkins_dev/src/content
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
site_type=$(gum choose --height 6 "Main" "Bear" "Coffee & Commits" "Ian-Watkins" "Terminal" "Stories")

echo "$(gum style --foreground \#b48ead "Sync GitHub?")"
  sync_github=$(gum choose --height 2 "yes" "no")

if [[ $site_type == "Main" ]]; then
    blog_path=$MAIN_BLOG_PATH
elif [[ $site_type == "Bear" ]]; then
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

if [[ $site_type == "Main" ]]; then
    echo "$(gum style --foreground \#b48ead "New Content?:")"
    content_type=$(gum choose --height 6 "Post" "Project" "Book" "Book Review" "No")

    if [[ $content_type != "No" ]]; then
        slug=$(gum input --placeholder "slug-name (no spaces, no extension)")

        if [[ -z $slug ]]; then
            echo "No slug entered. Exiting."
            cd $blog_path
            exit 1
        fi

        local temp="${slug:gs/-/ /}"
        local title="${(C)temp}"
    fi

    if [[ $content_type == "Post" ]]; then
        cd "$blog_path/posts" || exit 1
        file="${slug}.mdx"
        cat > "$file" <<EOF
---
title: "$title"
date: $(date +%Y-%m-%d)
description: ""
tags: []
draft: true
---

EOF
        hx "$file"

    elif [[ $content_type == "Project" ]]; then
        cd "$blog_path/projects" || exit 1
        file="${slug}.mdx"
        cat > "$file" <<EOF
---
title: "$title"
description: ""
url: ""
repo: ""
tags: []
featured: false
---

EOF
        hx "$file"

    elif [[ $content_type == "Book" ]]; then
        cd "$blog_path/books" || exit 1
        file="${slug}.md"
        cat > "$file" <<EOF
---
title: "$title"
author: ""
amazonUrl: ""
status: "tbr"
dateRead: ""
---
EOF
        hx "$file"

    elif [[ $content_type == "Book Review" ]]; then
        book_file="${slug}.md"
        if [[ ! -f "$blog_path/books/$book_file" ]]; then
            cat > "$blog_path/books/$book_file" <<EOF
---
title: "$title"
author: ""
amazonUrl: ""
genre: ""
status: "read"
dateRead: $(date +%Y-%m-%d)
rating: 4
---
EOF
            echo "✅ Book file created: books/$book_file"
        else
            echo "⚠️  Book file already exists: books/$book_file (skipping)"
        fi

        cd "$blog_path/bookreviews" || exit 1
        file="${slug}.mdx"
        cat > "$file" <<EOF
---
title: "$title"
author: ""
date: $(date +%Y-%m-%d)
description: ""
rating: 4
tags: []
draft: true
amazonUrl: ""
---

EOF
        hx "$file" "$blog_path/books/$book_file"
    fi
fi
