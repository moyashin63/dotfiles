#!/bin/sh
if has "brew"; then
  echo "$(tput setaf 2)Already installed Homebrew ✔︎$(tput sgr0)"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install zsh
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

brew install tmux
rm ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

brew install neovim
rm ~/.config/nvim/init.vim
ln -s ~/dotfiles/.zshrc ~/.zshrc

ln -s ~/dotfiles/.config/nvim/dein.toml ~/.config/nvim/dein.toml
ln -s ~/dotfiles/.config/nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml

brew install nodebrew
nodebrew setup
nodebrew install-binary stable
#echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zshrc

#-----powerline-shell
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
sudo python setup.py install
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#-----enhancd
cd ~
git clone https://github.com/b4b4r07/enhancd.git

#-----
brew install fzf

#-----
#-----
