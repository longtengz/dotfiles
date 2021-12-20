# deploy my dotfiles to this environment

REPO_DIR=`pwd -P`

echo $REPO_DIR

# ========================================================= install =========================================================
# install (
# 	ohmyzsh
# 	brew
#   coreutils
#	tmux
# 	fzf
#	ag
#	bat
#   mosh	
# )

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# coreutils
brew install coreutils

# tmux
brew install tmux

# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# ag
brew install the_silver_searcher

# bat
brew install bat

# mosh
brew install mosh

# materialize all the submodules
git submodule update --init

# update every submodule
git submodule foreach git pull origin master

# ========================================================= configs =========================================================

# create symlinks
# so any changes could go straight to the this git repo

#   vim
ln -sv "$REPO_DIR/vimrc" ~/.vimrc
ln -sv "$REPO_DIR/vim" ~/.vim

# set up tmux
ln -sv "$REPO_DIR/tmux.conf" ~/.tmux.conf

# zsh
ln -sv "$REPO_DIR/system/zshrc" ~/.zshrc
ln -sv "$REPO_DIR/system/zprofile" ~/.zprofile

# source rupa/z
echo ". $REPO_DIR/tools/z/z.sh" >> ~/.zshrc

echo "# configurations of installed dotfiles

[ -z \"\$DOTFILES_DIR\" ] && export DOTFILES_DIR=$REPO_DIR

" >> ~/.dotfiles_config
