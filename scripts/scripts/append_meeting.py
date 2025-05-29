import sys
from datetime import date
from pathlib import Path

# Constants
today = date.today()
formatted_date = today.strftime("%Y-%m-%d")
meet_dir = (
    Path.home() / "Documents" / "Obsidian" / "Work" / "ASAP" / "Meetings"
)
rme_meet_dir = (
    Path.home() / "Documents" / "Obsidian" / "Work" / "RME" / "Meetings"
)

# Template block to append
meeting_block = f"""
## {formatted_date} | 'Meaningful Name'

### Action Items

### Notes

- first
- second
- third
"""


def append_to_meeting():
    company = input("Which company? (ASAP/RME): ").strip().upper()
    
    if company == "ASAP":
        dir_path = meet_dir
    elif company == "RME":
        dir_path = rme_meet_dir
    else:
        print("❌ Unknown company. Please choose ASAP or RME.")
        sys.exit(1)
    meeting_name = input("Which Meeting?: ").strip()
    note_path = dir_path / f"{meeting_name}.md"

    if not note_path.exists():
        print(f"❌ No existing meeting note found for {meeting_name} at {note_path}")
        sys.exit(1)

    meeting_title = input("Meeting title (optional): ").strip() or 'Meaningful Name'
    block_content = meeting_block.replace("'Meaningful Name'", f"'{meeting_title}'")
    
    try:
        with open(note_path, "a") as f:
            f.write("\n\n" + block_content.strip() + "\n")
        print(f"✅ Appended new meeting block for {formatted_date} to {note_path}")
    except Exception as e:
        print(f"❌ Failed to append note: {e}")
        sys.exit(1)


if __name__ == "__main__":
    append_to_meeting()
