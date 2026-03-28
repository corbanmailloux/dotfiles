#### Environment variables
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export HOMEBREW_NO_ENV_HINTS=1

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

export LS_COLORS='di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

#### Aliases
# Git aliases - These are muscle memory from the git OMZ plugin, so I'm keeping them.
alias g='git'
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'

alias ls='ls -hG' # Enable colorized output for ls, and human-readable file sizes
alias l='ls -alh' # Human-readable long listing format, including hidden files
alias rm='rm -i' # Prompt before deleting files

#### Completions System
# Add Homebrew's completions to the lookup path (FPATH)
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
# Use a menu-style interface for tab completion
zstyle ':completion:*' menu select
# Case-insensitive completion (so 'cd doc' finds 'Documents')
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Enable auto-completion of options for aliases
setopt COMPLETE_ALIASES
autoload -Uz compinit
compinit

#### Tweaks
# Use opt-left and opt-right to move by word, especially for auto-suggestions.
bindkey "[D" backward-word
bindkey "[C" forward-word

setopt autocd # Allow moving to directories without `cd`

# Use pure prompt: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

#### ZSH plugins
eval "$(zoxide init zsh)"
source <(fzf --zsh) # Set up fzf key bindings and fuzzy completion
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Must be last.

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
