#!/bin/zsh

# Define blog directory
BLOG_DIR="/Users/ianwatkins/dev/github/MistbornOne/blog/ian-watkins"

# Check if gum is installed
if ! command -v gum &> /dev/null; then
  echo "❌ Gum is not installed. Please install it to use this script."
  echo "   Visit https://github.com/charmbracelet/gum for installation instructions."
  exit 1
fi

# Use gum to choose content type with a pretty UI
echo "$(gum style --foreground 212 "Select content type:")"
content_type=$(gum choose --height 3 "posts" "projects" "sales")

# Use gum input for content name with a pretty prompt
name=$(gum input --placeholder "my-awesome-content" --prompt "$(gum style --foreground 212 "Content Name: ")" --width 40)

# If name is empty, exit
if [[ -z "$name" ]]; then
  echo "$(gum style --foreground 213 "⚠️  No name provided. Exiting.")"
  exit 1
fi

# Ensure filename has .md extension
if [[ ! $name =~ \.md$ ]]; then
  name="${name}.md"
fi

# Show spinner while creating content
gum spin --spinner dot --title "Creating new $content_type content..." -- sleep 0.5

# Change to blog directory
if [[ ! -d "$BLOG_DIR" ]]; then
  gum style --foreground 196 "❌ Blog directory not found: $BLOG_DIR"
  exit 1
fi

# Navigate to blog directory and run hugo command
cd "$BLOG_DIR"

# Capture hugo output and exit code
output=$(hugo new "content/$content_type/$name" 2>&1)
exit_code=$?

if [[ $exit_code -ne 0 ]]; then
  gum style --foreground 196 "❌ Hugo error:"
  echo "$output"
  exit 1
fi

# Extract file path between double quotes
filepath="${output#*\"}"
filepath="${filepath%%\"*}"

echo "$(gum style --foreground 240 "DEBUG: Extracted filepath = '$filepath'")"

if [[ -f "$filepath" ]]; then
  gum style --foreground 46 "✅ Content created successfully at: $filepath"
  
  # Ask if user wants to edit the file
  if gum confirm "Would you like to edit this file now?"; then
    nvim "$filepath"
  fi
else
  gum style --foreground 213 "⚠️  Could not find file: $filepath"
fi

