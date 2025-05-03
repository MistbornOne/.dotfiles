#!/bin/zsh

echo -n "Blog Post Name: "
read name

# Capture hugo output and exit code
output=$(hugo new "content/posts/$name" 2>&1)
exit_code=$?

if [[ $exit_code -ne 0 ]]; then
  echo "❌ Hugo error:"
  echo "$output"
  exit 1
fi

# Extract file path between double quotes
filepath="${output#*\"}"
filepath="${filepath%%\"*}"

echo "DEBUG: Extracted filepath = '$filepath'"

if [[ -f "$filepath" ]]; then
  nvim "$filepath"
else
  echo "⚠️  Could not find file: $filepath"
fi

