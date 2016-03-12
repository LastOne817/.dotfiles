#!/bin/bash

# Vundle install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install Plugins
cp .vimrc $HOME/.vimrc
vim +PluginInstall +qall

# zsh install
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# Install Plugins
cp .zshrc $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/yonchu/zsh-vcs-prompt.git ~/.oh-my-zsh/zsh-vcs-prompt
chsh -s $(which zsh)
