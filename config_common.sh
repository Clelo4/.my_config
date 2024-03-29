##########################################################################
# @file run.sh
# @author Jack
# @mail chengjunjie.jack@gmail.com
# @date 2021-12-12
# @version 0.1
#########################################################################

#!/usr/bin/env bash

set -e

WORK_FOLDER=$(dirname $(readlink -f "$0"))

. ./utils.sh

command -v vim &> /dev/null || {
  install_software vim
}

command -v git &> /dev/null || {
  install_software git
}

### install .vimrc
if [[ -L ~/.vimrc ]]; then
  unlink ~/.vimrc
fi
if [[ -f ~/.vimrc ]]; then
  mv ~/.vimrc ~/.vimrc_bak_$(date "+%s")
fi
set -x;
ln -s ${WORK_FOLDER}/.vimrc ~/.vimrc
set +x;
###

### install .vim
if [[ -L ~/.vim ]]; then
  unlink ~/.vim
fi
if [[ -d ~/.vim ]]; then
  mv ~/.vim ~/.vim_bak_$(date "+%s")
fi
set -x;
ln -s ${WORK_FOLDER}/.vim ~/.vim
set +x;
###

### install .gitconfig
if [[ ! -f ~/.gitconfig ]]; then
  set -x;
  ln -s ${WORK_FOLDER}/.gitconfig ~/.gitconfig
  set +x;
fi
