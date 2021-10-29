#!/bin/bash

### General packages
sudo apt-get install -y sudo curl pass

### Fish
sudo apt-get install -y fish

chsh -s /usr/bin/fish

mkdir -p ~/.config/fish/
ln -s ~/workspace/dotfiles/config.fish ~/.config/fish/config.fish

### Neovim
sudo apt-get install -y neovim

mkdir -p ~/.config/nvim/
ln -s ~/workspace/dotfiles/.vimrc ~/.config/nvim/init.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +q +q

### Asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
mkdir -p ~/.config/fish/completions; ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

### Docker
sudo apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker docker
# newgrp docker

# docker run hello-world

### Fish related setup steps

fish ~/workspace/dotfiles/setup-ubuntu.fish
