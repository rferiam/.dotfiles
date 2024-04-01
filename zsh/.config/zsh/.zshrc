HISTFILE="$ZDOTDIR/.zsh_history"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#e1ad01"

PATH="$HOME/go/bin:$PATH"
PATH="$HOME/bin:$PATH"

bindkey -v

[ -f "$ZDOTDIR/.fzf.zsh" ] && source "$ZDOTDIR/.fzf.zsh"

alias vim="nvim"
alias ls="eza -1A --icons --group-directories-first"
alias cat="bat"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
