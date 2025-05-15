
#==============================
# ============ PATH ===========
# =============================
path=(
  $path
  $HOME/scripts
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

# Update scripts
alias update="~/scripts/update.sh"
alias sync="~/scripts/gitsync.sh"
alias gendate="~/scripts/gendate.sh"
alias post=". ~/scripts/blogpost.sh"

# Path scripts
alias dot=". ~/scripts/dotfiles.sh"
alias path="~/scripts/path.sh"
alias scr=". ~/scripts/scriptspath.sh"
alias notes=". ~/scripts/notespath.sh"
alias idn=". ~/scripts/inkdrop.sh"
alias dev=". ~/scripts/devpath.sh"
alias blog=". ~/scripts/blog.sh"
alias drive=". ~/scripts/one-drive-path.sh"
alias games=". ~/scripts/games.sh"

# Alias Mapping for Functions
alias jk="clear" 
alias fzf="fzf --bind 'enter:become(nvim {})'"

#~~~~Envman Settings~~~~

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"



#~~~~Go Settings~~~~


#Go Bin for Boot.dev
#'export PATH=$PATH:$HOME/.local/opt/go-bin-v1.24.2/bin'



#~~~~The Fuck Settings~~~~

#Alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)



#~~~~FZF~~~~

eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND= "fd --hidden --strip-cwd-prefix --exclude .git"



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





