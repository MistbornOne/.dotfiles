#!/usr/bin/env python3

import datetime
import os
import re
import subprocess
import sys
from pathlib import Path

# Configuration - modify these variables
OBSIDIAN_INBOX = os.path.expanduser(
    "~/Documents/Obsidian/notes-inbox/"
)  # Update this path
DEFAULT_TITLE = "New Note"


def slugify(text):
    """Convert text to a URL-friendly slug"""
    # Convert to lowercase and replace spaces with hyphens
    text = text.lower()
    # Remove non-alphanumeric characters (except hyphens and spaces)
    text = re.sub(r"[^a-z0-9\s-]", "", text)
    # Replace spaces with hyphens
    text = re.sub(r"\s+", "-", text)
    # Remove multiple consecutive hyphens
    text = re.sub(r"-+", "-", text)
    return text


def title_case(text):
    """Convert text to title case (capitalize first letter of each word)"""
    return " ".join(word.capitalize() for word in text.split())


def create_note(title=DEFAULT_TITLE):
    """Create a new Obsidian note in the inbox"""
    # Check if the Obsidian inbox directory exists
    inbox_path = Path(OBSIDIAN_INBOX)
    if not inbox_path.exists() or not inbox_path.is_dir():
        print(f"Error: Obsidian inbox directory does not exist at '{OBSIDIAN_INBOX}'")
        print("Please update the script with the correct path.")
        return False

    # Generate timestamp for frontmatter only
    now = datetime.datetime.now()
    date_formatted = now.strftime("%Y-%m-%d %H:%M:%S")

    # Create filename from slug only (no timestamp)
    slug = slugify(title)
    filename = f"{slug}.md"
    filepath = inbox_path / filename

    # Check if file already exists and handle accordingly
    counter = 1
    original_slug = slug
    while filepath.exists():
        # If file exists, append a number
        slug = f"{original_slug}-{counter}"
        filename = f"{slug}.md"
        filepath = inbox_path / filename
        counter += 1

    # Convert title to title case for the content
    title_formatted = title_case(title)

    # Create the note with frontmatter
    with open(filepath, "w") as file:
        file.write(
            f"""---
title: "{title}"
date: {date_formatted}
tags: []
status: inbox
---

# {title_formatted}

"""
        )

    print(f"Note created at {filepath}")

    # Open the file in neovim
    subprocess.run(["nvim", str(filepath)])

    return True


def main():
    """Main function to handle command-line arguments"""
    # Get title from command-line arguments
    if len(sys.argv) > 1:
        title = " ".join(sys.argv[1:])
    else:
        title = DEFAULT_TITLE

    create_note(title)


if __name__ == "__main__":
    main()
