
#~~~~~~~~~~ PATH ~~~~~~~~~~

export PATH="$PATH:/Users/ianwatkins/dev/github/MistbornOne/projects/programs"

export PATH="$PATH:/Users/ianwatkins/.dotfiles/scripts"

#~~~~~~~~~~ Starship Init ~~~~~~~~~~

eval "$(starship init zsh)"

#~~~~Syntax Highlighting Settings~~~~


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



#~~~~zsh Completion Settings~~~~


if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi


#~~~~zsh Suggestions~~~~

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#Keybindings 
bindkey -e
bindkey ";k" history-search-backward
bindkey ";j" history-search-forward

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no


#~~~~Alias~~~~

# Alias for creating Obsidian notes
alias on='python3 $HOME/dev/github/MistbornOne/projects/scripts/obsidian-new.py'

alias dotup="~/.dotfiles/scripts/update.sh"

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





