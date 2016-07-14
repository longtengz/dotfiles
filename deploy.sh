#! /bin/bash

# deploy my dotfiles to this environment

REPO_DIR=`pwd -P`

# echo $REPO_DIR


# create symlinks
# so any changes could go straight to the this git repo

#   vim
ln -sv "$REPO_DIR/vimrc" ~/.vimrc
ln -sv "$REPO_DIR/vim" ~/.vim

#   bash
ln -sv "$REPO_DIR/bashrc" ~/.bashrc
ln -sv "$REPO_DIR/bash_profile" ~/.bash_profile


echo "# configurations of installed dotfiles

[ -z \"\$DOTFILES_DIR\" ] && export DOTFILES_DIR=$REPO_DIR

" > ~/.dotfiles_config








