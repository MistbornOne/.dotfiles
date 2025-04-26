## Ghostty Configuration

These are my personal Ghostty config files.

In the config file, you will find my personal
config settings, which I often update per my current
mood.

In the config_default file, you will find the default
Ghostty configuration settings.

Please note, you can clone either the repo or just
copy the code from either file and use on your own
machine to help configure Ghostty.

If you plan to make edits, you will need to create
a directory and place a new config file within that
directory. Then you will need to point the initial
config .txt file to your new config file to make
sure it loads properly.

**That will look something like this:**

```
config-file = /Users/ianwatkins/dev/github/ghostty/config

```

Replace my filepath with yours and save the .txt
file. Then you can restart Ghostty and it will now
look to the custom config file and reflect them.

**That will look something like this (though you can place the line anywhere in the file,
I personally prefer to place it at the bottom.):**

```
# This is the configuration file for Ghostty.
#
# This template file has been automatically created at the following
# path since Ghostty couldn't find any existing config files on your system:
#
#   /Users/ianwatkins/Library/Application Support/com.mitchellh.ghostty/config
#
# The template does not set any default options, since Ghostty ships
# with sensible defaults for all options. Users should only need to set
# options that they want to change from the default.
#
# Run `ghostty +show-config --default --docs` to view a list of
# all available config options and their default values.
#
# Additionally, each config option is also explained in detail
# on Ghostty's website, at https://ghostty.org/docs/config.

# Config syntax crash course
# ==========================
# # The config file consists of simple key-value pairs,
# # separated by equals signs.
# font-family = Iosevka
# window-padding-x = 2
#
# # Spacing around the equals sign does not matter.
# # All of these are identical:
# key=value
# key= value
# key =value
# key = value
#
# # Any line beginning with a # is a comment. It's not possible to put
# # a comment after a config option, since it would be interpreted as a
# # part of the value. For example, this will have a value of "#123abc":
# background = #123abc
#
# # Empty values are used to reset config keys to default.
# key =
#
# # Some config options have unique syntaxes for their value,
# # which is explained in the docs for that config option.
# # Just for example:
# resize-overlay-duration = 4s 200ms

config-file = /Users/ianwatkins/dev/github/ghostty/config

```

Each time you edit the config file, make sure to
save it and then restart Ghostty or refresh it. I
use MacOS and on that the refresh shortcut is
"command + ,".

Let me know if you have any questions, but I hope
this is helpful. When I was first starting out
using terminal emulators and came across Ghostty,
I was pumped about the ability to customize it -
but was discouraged by my lack of understanding
on how to make those changes happen. So, I wrote
this with absolute beginners in mind 🙏
