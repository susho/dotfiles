# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# golang
if [ -e "/usr/local/go" ]; then
  export GOPATH=$HOME/work
  export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"
fi

# alias ctags
if [ -e /usr/local/bin/brew ]; then
  alias ctags="`brew --prefix`/bin/ctags"
fi

setopt share_history
alias history="history -i"

if [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
    ssh-agent > ~/.ssh-agent
    . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add
