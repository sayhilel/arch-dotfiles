# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/croxymoc/.zshrc'

autoload -Uz compinit 
compinit
# End of lines added by compinstall
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# lazy load virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh
#Aliases
alias s="kitty +kitten ssh"

eval "$(zoxide init zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/croxymoc/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 1 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/croxymoc/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/croxymoc/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/croxymoc/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/croxymoc/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/croxymoc/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/croxymoc/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# bun completions
[ -s "/home/croxymoc/.bun/_bun" ] && source "/home/croxymoc/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
