##########################################################################
# @file run.sh
# @author Jack
# @mail chengjunjie.jack@gmail.com
# @date 2021-12-12
# @version 0.1
#########################################################################

#!/usr/bin/env bash

set -e

SHELL_FOLDER=$(cd "$(dirname "$0")"; pwd)
echo $SHELL_FOLDER

if [[ -L ~/.vimrc ]]; then
  unlink ~/.vimrc
fi
if [[ -f ~/.vimrc ]]; then
  mv ~/.vimrc ~/.vimrc_bak_$(date "+%s")
fi
ln -s ${SHELL_FOLDER}/.vimrc ~/.vimrc

if [[ -L ~/.vim ]]; then
  unlink ~/.vim
fi
if [[ -d ~/.vim ]]; then
  mv ~/.vim ~/.vim_bak_$(date "+%s")
fi
ln -s ${SHELL_FOLDER}/.vim ~/.vim
