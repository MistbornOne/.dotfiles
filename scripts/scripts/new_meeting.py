import sys
from datetime import date
from pathlib import Path

# Constants
today = date.today()
formatted_date = today.strftime("%Y-%m-%d")
meet_dir = Path.home() / "Documents" / "Obsidian" / "Work" / "ASAP" / "Meetings"

# rme_meet_dir = Path.home() / "Documents" / "Obsidian" / "Work" / "RME" / "Meetings"
coaching_dir = (
    Path.home() / "Documents" / "Obsidian" / "Work" / "ASAP" / "Meetings" / "1:1"
)
coaching_template_path = (
    Path.home() / "Documents" / "Obsidian" / "Templates" / "coaching_template.md"
)
meeting_template_path = (
    Path.home() / "Documents" / "Obsidian" / "Templates" / "meeting_template.md"
)


def create_note(template_path, output_path, replacements, dir_path):
    if output_path.exists():
        print("Note already exists - aborting process")
        sys.exit(2)

    try:
        content = template_path.read_text()
    except FileNotFoundError:
        print(f"Template file not found at {template_path}")
        sys.exit(1)

    for key, value in replacements.items():
        content = content.replace(key, value)

    dir_path.mkdir(parents=True, exist_ok=True)
    output_path.write_text(content)

    print(f"✅ Created Note: {output_path}")


# =====================
#      Meetings
# =====================
def make_meeting():
    meeting_name = input("Which Meeting?: ")

    if not meeting_name:
        print("Meeting name cannot be empty")
        sys.exit(1)

    meeting_note_path = meet_dir / f"{meeting_name}.md"

    create_note(
        template_path=meeting_template_path,
        output_path=meeting_note_path,
        replacements={"{{date}}": formatted_date, "{{meeting name}}": meeting_name},
        dir_path=meet_dir,
    )


# =====================
#        1:1
# =====================
def make_coaching_meeting():

    coaching_name = input("Which Employee?: ").strip()
    initials = "".join([part[0].upper() for part in coaching_name.split() if part])
    coaching_note_path = coaching_dir / f"{initials}.md"

    create_note(
        template_path=coaching_template_path,
        output_path=coaching_note_path,
        replacements={"{{date}}": formatted_date, "{{name}}": coaching_name},
        dir_path=coaching_dir,
    )


if __name__ == "__main__":
    choice = input("What type of note? (Meeting/1:1): ").strip().lower()

    if choice == "meeting":
        make_meeting()
    elif choice == "1:1":
        make_coaching_meeting()
    else:
        print("❌ Unknown Option")
        sys.exit(1)
