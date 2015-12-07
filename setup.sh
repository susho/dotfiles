#!/bin/sh

# zsh install
if [ ! -e /bin/zsh ]; then
  sudo yum install zsh -y
  chsh -s /bin/zsh
fi


# oh-my-zsh install
if [ ! -e $HOME/.oh-my-zsh ]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi


# overwrite dotfiles
function fileSetUp()
{
    fileName=$1

    if [ ! -e $HOME/${fileName} ]; then
      echo "ln -s dotfiles/${fileName} $HOME/${fileName}"
      ln -s dotfiles/${fileName} $HOME/${fileName}
    else
      cmp dotfiles/${fileName} $HOME/${fileName} > /dev/null
      ret=$?
      if [ ! "$ret" = "0" ]; then
        echo "Can I overwrite $HOME/${fileName} ? (yes/no)"
        read ans
        if [ "$ans" = "yes" ]; then
          mv $HOME/${fileName} $HOME/${fileName}.OLD
          ln -s dotfiles/${fileName} $HOME/${fileName}
          echo "overwrite $HOME/${fileName}"
        fi
      fi
    fi
}

fileSetUp .zshrc
fileSetUp .vimrc
fileSetUp .gitconfig
fileSetUp .tmux
