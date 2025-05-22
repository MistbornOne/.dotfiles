#!/bin/env python3

import argparse
import sys


# format text based on pattern
def formatter(pattern):
    def inner_func(text):
        result = ""
        i = 0
        while i < len(pattern):
            if pattern[i : i + 2] == "{}":
                result += text
                i += 2
            else:
                result += pattern[i]
                i += 1
        return result

    return inner_func


bold_formatter = formatter("**{}**")
italic_formatter = formatter("*{}*")
bullet_formatter = formatter("* {}")
code_formatter = formatter("`{}`")
code_block_formatter = formatter("```{}```")
strike_formatter = formatter("~~{}~~")
highlight_formatter = formatter(("=={}=="))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Apply Markdown formatting to text")
    parser.add_argument(
        "format_type",
        choices=[
            "bold",
            "italic",
            "bullet",
            "code",
            "code_block",
            "strike",
            "highlight",
        ],
        help="Type of formatting to apply",
    )
    parser.add_argument(
        "--text", "-t", help="Text to format (if not provided, will read from stdin)"
    )

    args = parser.parse_args()

    # Get the text either from argument or stdin
    if args.text:
        text_to_format = args.text
    else:
        text_to_format = sys.stdin.read().strip()

    # Apply the requested formatting
    if args.format_type == "bold":
        result = bold_formatter(text_to_format)
    elif args.format_type == "italic":
        result = italic_formatter(text_to_format)
    elif args.format_type == "bullet":
        result = bullet_formatter(text_to_format)
    elif args.format_type == "code":
        result = code_formatter(text_to_format)
    elif args.format_type == "code_block":
        result = code_block_formatter(text_to_format)
    elif args.format_type == "strike":
        result = strike_formatter(text_to_format)
    elif args.format_type == "highlight":
        result = highlight_formatter(text_to_format)

    # Output the formatted text (this will be captured by the editor)
    print(result, end="")
