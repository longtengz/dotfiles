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
ln -sv "$REPO_DIR/system/bashrc" ~/.bashrc
ln -sv "$REPO_DIR/system/bash_profile" ~/.bash_profile

# source rupa/z
echo ". $REPO_DIR/tools/z/z.sh" >> ~/.bashrc

echo "# configurations of installed dotfiles

[ -z \"\$DOTFILES_DIR\" ] && export DOTFILES_DIR=$REPO_DIR

" >> ~/.dotfiles_config

# materialize all the submodules
git submodule update --init

# update every submodule
git submodule foreach git pull origin master

# install Conque-Shell
vim -c 'so %' -c 'q' "$REPO_DIR/vim/vimballs/conque_2.3.vmb"

# install the silver searcher ag
brew install the_silver_searcher

# install universal-ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# install fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# install tmux
brew install tmux
