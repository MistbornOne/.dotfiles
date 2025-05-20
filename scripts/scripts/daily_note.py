import sys
from datetime import date
from pathlib import Path

# PERF: Check for current day of the week, if weekend then exit
# PERF: Generate current day filename using formatted_date
# PERF: Check if note already exists in ~/Documents/Obsidian/Work/Daily/
# PERF: Read template from ~/Documents/Obsidian/Templates/daily.md
# PERF: Write new file in the /Work/Daily directory using template

# Constants
today = date.today()
formatted_date = today.strftime("%Y-%m-%d")
base_dir = Path.home() / "Documents" / "Obsidian" / "Work" / "Daily"
note_path = base_dir / f"{formatted_date}.md"
template_path = Path.home() / "Documents" / "Obsidian" / "Templates" / "daily.md"


def is_weekday():
    return today.weekday() < 5


def main():
    # Check for current date
    if not is_weekday():
        sys.exit(2)

    if note_path.exists():
        print("Note already exists - aborting process")
        sys.exit(2)

    try:
        with open(template_path, "r") as template_file:
            content = template_file.read()

    except FileNotFoundError:
        print(f"Template file not found at {template_path}")
        sys.exit(1)

    filled_content = content.replace("{{date}}", formatted_date)

    base_dir.mkdir(parents=True, exist_ok=True)

    with open(note_path, "w") as new_note:
        new_note.write(filled_content)

    print(f"✅ Created note: {note_path}")


if __name__ == "__main__":
    main()
