HISTFILE="$ZDOTDIR/.zsh_history"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#e1ad01"

PATH="$HOME/go/bin:$PATH"
PATH="$HOME/bin:$PATH"

bindkey -v

alias vim="nvim"
alias ls="eza -1A --icons --group-directories-first"
alias cat="bat"
alias flushcache='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
