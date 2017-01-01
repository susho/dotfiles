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

# alias ctags
if [ -e /usr/local/bin/brew ]; then
  alias ctags="`brew --prefix`/bin/ctags"
fi

setopt share_history
alias history="history -i"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/suzukishouta/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/suzukishouta/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/suzukishouta/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/suzukishouta/google-cloud-sdk/completion.zsh.inc'
fi
