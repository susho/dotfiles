#!/bin/bash

# install zprezto
if [ ! -e ${ZDOTDIR:-$HOME}/.zprezto ]; then
  echo "Installing... zprezto" 

  FILES=('zlogin' 'zlogout' 'zprofile' 'zshenv')
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in ${FILES[@]}; do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

# install vim-plug
if [ ! -e ~/.vim/autoload/plug.vim ]; then
  echo "Installing... vim-plug" 

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# set up a dotfile
function setup_dotfile()
{
  fileName=$1
  srcDir=$HOME/work/src/github.com/susho/dotfiles

  cmp ${srcDir}/${fileName} $HOME/${fileName} > /dev/null
  ret=$?
  if [ ! "$ret" = "0" ]; then
    echo "Can I overwrite $HOME/${fileName} ? (Y/n)"
      read ans
      if [ "$ans" = "Y" ]; then
        mv $HOME/${fileName} $HOME/${fileName}.OLD
        ln -s ${srcDir}/${fileName} $HOME/${fileName}
        echo "overwrite $HOME/${fileName}"
      fi
  fi
}

setup_dotfile .zshrc
setup_dotfile .zpreztorc
setup_dotfile .vimrc
setup_dotfile .gitconfig
setup_dotfile .tmux.conf
