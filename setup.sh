#!/bin/sh

# oh-my-zsh install
if [[ ! -e $HOME/.oh-my-zsh ]]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi


# overwrite dotfiles

function fileSetUp()
{
    fileName=$1

    if [[ ! -e ~/${fileName} ]]; then
      echo "cp ./${fileName} ~/${fileName}"
      cp ./${fileName} ~/${fileName}
    else
      cmp ./${fileName} ~/${fileName} > /dev/null
      ret=$?
      if [[ ! "$ret" = "0" ]]; then
        echo "Can I overwrite ~/${fileName} ? (yes/no)"
        read ans
        if [[ "$ans" = "yes" ]]; then
          cp ~/${fileName} ~/${fileName}.OLD
          cp ./${fileName} ~/${fileName}
          echo "overwrite ~/${fileName}"
        fi
      fi
    fi
}

fileSetUp .zshrc
fileSetUp .vimrc
