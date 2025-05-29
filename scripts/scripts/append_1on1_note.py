import sys
from datetime import date
from pathlib import Path

# Constants
today = date.today()
formatted_date = today.strftime("%Y-%m-%d")
coaching_dir = (
    Path.home() / "Documents" / "Obsidian" / "Work" / "ASAP" / "Meetings" / "1:1"
)

# Template block to append
meeting_block = f"""
## {formatted_date} | 1:1

### Progress Towards Monthly Goals

- Quotes:
- Revenue:
- Prospecting:
- Team Rank:

### Pipeline Review:

- Top 3 Opportunities?:
  1.
  2.
  3.
- Next Steps?

#### Notes
"""


def append_to_1on1():
    full_name = input("Which Employee?: ").strip()
    initials = "".join([part[0].upper() for part in full_name.split() if part])
    note_path = coaching_dir / f"{initials}.md"

    if not note_path.exists():
        print(f"❌ No existing 1:1 note found for {initials} at {note_path}")
        sys.exit(1)

    try:
        with open(note_path, "a") as f:
            f.write("\n\n" + meeting_block.strip() + "\n")
        print(f"✅ Appended new meeting block for {formatted_date} to {note_path}")
    except Exception as e:
        print(f"❌ Failed to append note: {e}")
        sys.exit(1)


if __name__ == "__main__":
    append_to_1on1()
