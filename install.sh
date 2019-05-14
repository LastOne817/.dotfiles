#!/bin/bash

# Install Plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/colors
cp vividchalk.vim $HOME/.vim/colors
vim +PlugInstall

# zsh install
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# Install Plugins
cp .zshrc $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/yonchu/zsh-vcs-prompt.git ~/.oh-my-zsh/zsh-vcs-prompt
chsh -s $(which zsh)

# git config
cp .gitconfig $HOME/.gitconfig

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
