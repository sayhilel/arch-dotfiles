# History
HISTFILE=~/.zhistory
HISTSIZE=5000000
SAVEHIST=5000000

# Options
setopt correct
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt nobeep
setopt appendhistory
setopt histignorealldups
setopt promptsubst

# Style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Theming
autoload -U compinit colors zcalc
compinit -d
colors
zmodload zsh/terminfo

# Prompt
## VCS Info Setup
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' disable cvs svn bzr hg
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'

## GIT Function
function add_git_status_info() {
  if [[ -n "$vcs_info_msg_0_" ]]; then
    local git_status=""
    local git_icon=" "

    ### Unstaged
    if ! git diff --quiet --ignore-submodules 2>/dev/null; then
      git_status="${git_status}!"
    fi

    ### Staged
    if ! git diff --cached --quiet --ignore-submodules 2>/dev/null; then
      git_status="${git_status}+"
    fi

    ### Untracked
    if [[ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]]; then
      git_status="${git_status}?"
    fi

    ### No Changes
    if [[ -z "$git_status" ]]; then
	    git_status="✔"
    fi

    vcs_info_msg_0_="${git_icon}${vcs_info_msg_0_}${git_status}"
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info
add-zsh-hook precmd add_git_status_info

## Prompt Setup
NEWLINE=$'\n'
PROMPT='%{$fg[cyan]%}%n@%m %{$fg[magenta]%}: %{$fg[yellow]%}%~ %{$fg[magenta]%}%{$reset_color%}
%F{yellow}→%f '
RPROMPT='%{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}'

# Plugins
## zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#50493e,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

## zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

# VIM Motions

eval "$(zoxide init zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
source <(fzf --zsh)

## NODE
nvm() {
    unset -f nvm
	export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 
    nvm "$@"
}

node() {
    unset -f node
	export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    node "$@"
}

npm() {
    unset -f npm
	export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 
    npm "$@"
}
