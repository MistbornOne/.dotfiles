#!/usr/bin/env python3

import datetime
import os
import re
import subprocess
import sys
from pathlib import Path

# Configuration - modify these variables
INKDROP_INBOX = os.path.expanduser(
    "~/Documents/Inkdrop Backup/PLAIN_TEXT/Inbox/"
)  # Update this path
DEFAULT_TITLE = "New Note"


def title_case(text):
    """Convert text to title case"""
    return " ".join(word.capitalize() for word in text.split())


def create_note(title=DEFAULT_TITLE):
    """Create a new Inkdrop note in the inbox"""
    # Check if the Inkdrop inbox directory exists
    inbox_path = Path(INKDROP_INBOX)
    if not inbox_path.exists() or not inbox_path.is_dir():
        print(f"Error: Inkdrop inbox directory does not exist at '{INKDROP_INBOX}'")
        print("Please update the script with the correct path.")
        return False

    title = title_case(title)

    # Create filename from title
    filename = f"{title}.md"
    filepath = inbox_path / filename

    # Check if file already exists and handle accordingly
    counter = 1
    original_title = title
    while filepath.exists():
        # If file exists, append a number
        title = f"{original_title} {counter}"
        filename = f"{title}.md"
        filepath = inbox_path / filename
        counter += 1

    # Convert title to title case for the content
    with open(filepath, "w") as file:
        file.write(f"## {title}\n")

    print(f"Note created at {filepath}")

    # Open the file in neovim
    subprocess.run(["nvim", str(filepath)])

    return True


def main():
    """Main function to handle command-line arguments"""
    # Get title from command-line arguments or prompt user
    if len(sys.argv) > 1:
        title = " ".join(sys.argv[1:])
    else:
        # Prompt user for a title
        title = input("Enter note title (or press Enter for default): ")
        # Use default title if user didn't enter anything
        if not title.strip():
            title = DEFAULT_TITLE

    create_note(title)


if __name__ == "__main__":
    main()
