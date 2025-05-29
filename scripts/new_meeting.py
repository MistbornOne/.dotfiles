import sys
from datetime import date
from pathlib import Path

# Constants
today = date.today()
formatted_date = today.strftime("%Y-%m-%d")
meet_dir = Path.home() / "Documents" / "Obsidian" / "Work" / "ASAP" / "Meetings"
rme_meet_dir = Path.home() / "Documents" / "Obsidian" / "Work" / "RME" / "Meetings"
coaching_dir = (
    Path.home() / "Documents" / "Obsidian" / "Work" / "ASAP" / "Meetings" / "1:1"
)
coaching_template_path = (
    Path.home() / "Documents" / "Obsidian" / "Templates" / "coaching_template.md"
)
meeting_template_path = (
    Path.home() / "Documents" / "Obsidian" / "Templates" / "meeting_template.md"
)

# Template fallbacks (in case of permission issues)
COACHING_TEMPLATE = """# 1:1 with {{name}}
Date: {{date}}

## Discussion Points
- 

## Action Items
- 
"""

MEETING_TEMPLATE = """# {{meeting name}}
Date: {{date}}

## Attendees
- 

## Agenda
- 

## Notes
- 

## Action Items
- 
"""

def create_note(template_path, output_path, replacements, dir_path):
    if output_path.exists():
        print(f"⚠️ Note already exists - aborting process")
        sys.exit(2)

    # Always use fallback templates for Obsidian files due to permission issues
    if "coaching_template" in str(template_path):
        content = COACHING_TEMPLATE
        print(f"Using coaching template fallback")
    else:  # meeting template
        content = MEETING_TEMPLATE
        print(f"Using meeting template fallback")

    # Replace placeholders
    for key, value in replacements.items():
        content = content.replace(key, value)
    
    # Create directory and write file
    try:
        dir_path.mkdir(parents=True, exist_ok=True)
        output_path.write_text(content)
        print(f"✅ Created Note: {output_path}")
    except Exception as e:
        print(f"❌ Error creating note: {e}")
        sys.exit(1)


# =====================
#      Meetings
# =====================
def make_meeting(company, meeting_name):
    if company == "ASAP":
        dir_path = meet_dir
    elif company == "RME":
        dir_path = rme_meet_dir
    else:
        print(f"❌ Unknown company: {company}. Please choose ASAP or RME.")
        sys.exit(1)

    if not meeting_name:
        print("❌ Meeting name cannot be empty")
        sys.exit(1)
        
    meeting_note_path = dir_path / f"{meeting_name}.md"

    create_note(
        template_path=meeting_template_path,
        output_path=meeting_note_path,
        replacements={"{{date}}": formatted_date, "{{meeting name}}": meeting_name},
        dir_path=dir_path,
    )


# =====================
#        1:1
# =====================
def make_coaching_meeting(coaching_name):
    if not coaching_name:
        print("❌ Employee name cannot be empty")
        sys.exit(1)
        
    initials = "".join([part[0].upper() for part in coaching_name.split() if part])
    coaching_note_path = coaching_dir / f"{initials}.md"

    create_note(
        template_path=coaching_template_path,
        output_path=coaching_note_path,
        replacements={"{{date}}": formatted_date, "{{name}}": coaching_name},
        dir_path=coaching_dir,
    )


if __name__ == "__main__":
    # Check for correct number of arguments
    if len(sys.argv) < 2:
        print("Usage: python new_meeting.py [meeting|1:1] [args...]")
        sys.exit(1)
        
    choice = sys.argv[1].lower()

    if choice == "meeting":
        if len(sys.argv) < 4:
            print("Usage: python new_meeting.py meeting [ASAP|RME] [meeting_name]")
            sys.exit(1)
        company = sys.argv[2]
        meeting_name = sys.argv[3]
        make_meeting(company, meeting_name)
    elif choice == "1:1":
        if len(sys.argv) < 3:
            print("Usage: python new_meeting.py 1:1 [employee_name]")
            sys.exit(1)
        employee_name = sys.argv[2]
        make_coaching_meeting(employee_name)
    else:
        print(f"❌ Unknown option: {choice}")
        print("Usage: python new_meeting.py [meeting|1:1] [args...]")
        sys.exit(1)
