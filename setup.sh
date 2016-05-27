#!/bin/sh

# install zsh
if [ ! -e /bin/zsh ]; then
  sudo yum install zsh -y
  chsh -s /bin/zsh
fi


# install oh-my-zsh
if [ ! -e $HOME/.oh-my-zsh ]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# install vim-go-ide
if [ ! -e ~/.vimrc.go ]; then
  git clone https://github.com/farazdagi/vim-go-ide.git
  sh ~/.vim_go_runtime/bin/install
fi

# update git submodule
git submodule init
git submodule update

# overwrite dotfiles
function fileSetUp()
{
    fileName=$1

    srcDir=$HOME/work/src/github.com/susho/dotfiles

    cmp ${srcDir}/${fileName} $HOME/${fileName} > /dev/null
    ret=$?
    if [ ! "$ret" = "0" ]; then
        echo "Can I overwrite $HOME/${fileName} ? (yes/no)"
        read ans
        if [ "$ans" = "yes" ]; then
          mv $HOME/${fileName} $HOME/${fileName}.OLD
          ln -s ${srcDir}/${fileName} $HOME/${fileName}
          echo "overwrite $HOME/${fileName}"
        fi
    fi
}

fileSetUp .zshrc
fileSetUp .vimrc
fileSetUp .vim
fileSetUp .gitconfig
fileSetUp .tmux
