#!/bin/bash

# install zsh
if [ ! -e /bin/zsh ]; then
  if [ -e /cat/redhat-release ]; then
    sudo yum install zsh -y
  else
    sudo apt-get install zsh -y
  fi
  chsh -s /bin/zsh
fi


# install zprezto
if [ ! -e ${ZDOTDIR:-$HOME}/.zprezto ]; then
  FILES=('zlogin' 'zlogout' 'zprofile' 'zshenv')
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in ${FILES[@]}; do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

# update git submodule
git submodule init
git submodule update

# overwrite dotfiles
function setUpDotFiles()
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

setUpDotFiles .zshrc
setUpDotFiles .zpreztorc
setUpDotFiles .vimrc
setUpDotFiles .vim
setUpDotFiles .gitconfig
setUpDotFiles .tmux
