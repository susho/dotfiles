# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# golang
if [ -e "/usr/local/go" ]; then
  export GOPATH=$HOME/work
  export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"
fi

# alias vim-go-ide
alias vimgo="vim -u ~/.vimrc.go"

# alias ctags
alias ctags="`brew --prefix`/bin/ctags"

setopt share_history
alias history="history -i"
