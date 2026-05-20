
#==============================
# ============ PATH ===========
# =============================
path=(
  $path
  $HOME/scripts
  $HOME/.local/opt/go-bin-v1.24.2/
  /opt/homebrew/bin/
  )

typeset -U path
path=($^path(N-/))

export PATH


#export PATH="$PATH:/Users/ianwatkins/dev/github/MistbornOne/projects/programs"

#export PATH="$PATH:/Users/ianwatkins/scripts"


#========================================
# ============ Starship Init ============
#========================================

eval "$(starship init zsh)"

#=======================================================
# ============ Syntax Highlighting Settings ============
#=======================================================

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#==================================================
# ============ zsh Completion Settings ============
#==================================================

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

#==========================================
# ============ zsh Suggestions ============
#==========================================

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#==============================================
# ============ Keybindings Section ============
#==============================================
bindkey -e
bindkey ";k" history-search-backward
bindkey ";j" history-search-forward

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no

#========================================
# ============ Alias Section ============
#========================================

# Alias for creating Obsidian notes
alias on='python3 ~/scripts/obsidian-new.py'
# Alias for creating Inkdrop notes
alias ink='python3 ~/scripts/inkdrop-new.py'

alias meet='python3 ~/scripts/new_meeting.py'
alias 1on1='python3 ~/scripts/append_1on1_note.py'
alias day='python3 ~/scripts/daily_note.py'
alias add='python3 ~/scripts/append_meeting.py'

# Update scripts
alias update="~/scripts/update.sh"
alias sync="~/scripts/gitsync.sh"
alias gendate="~/scripts/gendate.sh"
alias post=". ~/scripts/blogpost.sh"
alias today='~/scripts/edit_today.sh'
alias habits="~/scripts/habits"
alias tutor=". ~/scripts/codetutor.sh"
alias hb="~/scripts/brew.sh"

# Path scripts
alias dot=". ~/scripts/dotfiles.sh"
alias path="~/scripts/path.sh"
alias scr=". ~/scripts/scriptspath.sh"
alias notes=". ~/scripts/notespath.sh"
alias idn=". ~/scripts/inkdrop.sh"
alias dev=". ~/scripts/devpath.sh"
alias blog="~/scripts/new_blog.sh"
alias drive=". ~/scripts/one-drive-path.sh"
alias games=". ~/scripts/games.sh"
alias vc=". ~/scripts/nvim_config.sh"
alias f="~/scripts/fzf_dir.sh"
alias proj=". ~/scripts/projectspath.sh"
alias daily=". ~/scripts/daily_note_path.sh"
alias home=". ~/scripts/home.sh"
alias lifeos=". ~/scripts/vaultpath.sh"
alias ai="cd ~/dev/github/MistbornOne/claude"
alias cowork="cd ~/dev/github/MistbornOne/claude/cowork/"

# Alias Mapping for Functions
alias jk="clear"
alias fzf="fzf --bind 'enter:become(nvim {})'"
alias z="source ~/.zshrc"
alias zzz="pmset sleepnow"
alias config="hx ~/.zshrc"



# Alias Git Settings
alias gs="git status"
alias ga.="git add ."
alias gp="git push origin main"

#~~~~Envman Settings~~~~

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"



#~~~~Go Settings~~~~


#Go Bin for Boot.dev
#'export PATH=$PATH:$HOME/.local/opt/go-bin-v1.24.2/bin'



#~~~~FZF~~~~

eval "$(fzf --zsh)"

#export FZF_DEFAULT_COMMAND= "fd --hidden --strip-cwd-prefix --exclude .git"



#~~~~Environment Variables~~~~

export BROWSER="safari"


#~~~~History~~~~

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt HIST_IGNORE_SPACE # Don't save when prefixed with a space
setopt HIST_IGNORE_DUPS # Don't save duplicate lines
setopt SHARE_HISTORY # Share history between sessions
setopt APPENDHISTORY # Appends commands to the history rather than rewriting
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ── blog content helpers ─────────────────────────────────────────────────────

_blog_root() {
  # Walk up from cwd to find the blog root by looking for the marker file.
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    [[ -f "$dir/astro.config.mjs" && -d "$dir/src/content" ]] && { echo "$dir"; return 0; }
    dir="${dir:h}"
  done
  echo "Error: not inside the blog repo." >&2
  return 1
}

_blog_slug() {
  # Convert a title string to a kebab-case slug.
  echo "$*" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\{2,\}/-/g' | sed 's/^-//;s/-$//'
}

# new-post "My Post Title"
new-post() {
  local root; root=$(_blog_root) || return 1
  local title="$*"
  [[ -z "$title" ]] && { echo "Usage: new-post \"Post Title\"" >&2; return 1; }
  local slug; slug=$(_blog_slug "$title")
  local file="$root/src/content/posts/${slug}.md"
  local date; date=$(date +%Y-%m-%d)
  cat > "$file" <<FRONTMATTER
---
title: "$title"
date: $date
description: ""
tags: []
draft: true
---
FRONTMATTER
  echo "Created: $file"
}

# new-book "Book Title" "Author Name"
new-book() {
  local root; root=$(_blog_root) || return 1
  local title="$1" author="$2"
  [[ -z "$title" || -z "$author" ]] && { echo "Usage: new-book \"Title\" \"Author\"" >&2; return 1; }
  local slug; slug=$(_blog_slug "$title")
  local file="$root/src/content/books/${slug}.md"
  cat > "$file" <<FRONTMATTER
---
title: "$title"
author: "$author"
amazonUrl: ""
status: "tbr"
genre: ""
---
FRONTMATTER
  echo "Created: $file"
}

# new-book-review "Book Title" "Author Name"
new-book-review() {
  local root; root=$(_blog_root) || return 1
  local title="$1" author="$2"
  [[ -z "$title" || -z "$author" ]] && { echo "Usage: new-book-review \"Title\" \"Author\"" >&2; return 1; }
  local slug; slug=$(_blog_slug "$title")
  local file="$root/src/content/bookreviews/${slug}.md"
  local date; date=$(date +%Y-%m-%d)
  cat > "$file" <<FRONTMATTER
---
title: "$title"
author: "$author"
date: $date
description: ""
rating: 5
tags: []
draft: true
amazonUrl: ""
---
FRONTMATTER
  echo "Created: $file"
}

# new-project "Project Name"
new-project() {
  local root; root=$(_blog_root) || return 1
  local title="$*"
  [[ -z "$title" ]] && { echo "Usage: new-project \"Project Name\"" >&2; return 1; }
  local slug; slug=$(_blog_slug "$title")
  local file="$root/src/content/projects/${slug}.md"
  cat > "$file" <<FRONTMATTER
---
title: "$title"
description: ""
url: ""
repo: ""
tags: []
featured: false
---
FRONTMATTER
  echo "Created: $file"
}




# After adding these, run `source ~/.zshrc` (or open a new terminal tab) and you're good.

# ## Usage

# ```
# new-post "Why I Love Field Notes"
# new-book "Deep Work" "Cal Newport"
# new-book-review "Think Again" "Adam Grant"
# new-project "My CLI Tool"
# ```

# Each command prints the created file path, so you can pipe it straight to your editor:

# ```
# open -a "Cursor" $(new-post "My next post")
# ```

# ## Notes

# - Posts and book reviews are created with `draft: true` so they won't publish accidentally.
# - `new-book` defaults to `status: "tbr"` — edit the file to change it to `reading` or `read`.
# - Optional fields (`url`, `repo`, `amazonUrl`, `canonicalUrl`) are included with empty strings
#   so you can fill or delete them without looking up the schema. Astro will ignore empty
#   optional strings as long as the field is marked `.optional()` in the schema — but if you
#   leave `url`/`repo` as `""` on a project, remove those lines since the schema expects a URL
#   or nothing (not an empty string).
