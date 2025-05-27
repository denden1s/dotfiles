export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="clean"

zstyle ':omz:update' mode auto      # update automatically without asking

source $ZSH/oh-my-zsh.sh

alias ls="exa --long --all --icons --time-style=long-iso --no-user"
alias find='fzf --preview "batcat --tabs 2 --color=always --style=numbers --line-range=:500 {}"'
alias cat='batcat'
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-bat)
alias drn="docker images -f \"dangling=true\" -q | xargs -r docker rmi"

prompt_return_code() {
    local ret_code=$?
    if [[ $ret_code -ne 0 ]]; then
        echo "%{$fg[red]%}[$ret_code]%{$reset_color%}"
    fi
}

RPROMPT='$(prompt_return_code)'"$RPROMPT"
