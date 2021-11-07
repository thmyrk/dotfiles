#!/bin/bash

### General packages
sudo apt-get install -y sudo curl pass net-tools jq

## Python
 sudo apt install python3-testresources
 curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
 python3 get-pip.py

 ### Chrome
 wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
 sudo apt install ./google-chrome-stable_current_amd64.deb

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

### Fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf -o 'Droid Sans Mono Nerd Font Complete.otf'
echo '### Remember to manually set the font in your terminal to Droid! ###'
cd ~/workspace/dotfiles

### Asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
mkdir -p ~/.config/fish/completions; ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

### Ctags
 mkdir -p ~/workspace/tools
 curl https://kumisystems.dl.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz -o ~/workspace/tools/ctags.tar.gz
 cd ~/workspace/tools
 tar -xf ctags.tar.gz
 cd ctags-5.8
 ./configure
 make
 sudo ln -s ~/workspace/tools/ctags-5.8/ctags /usr/bin/ctags
 cd ~/workspace/dotfiles

### Docker & docker-compose
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

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

### Fish related setup steps

fish ~/workspace/dotfiles/setup-ubuntu.fish

### Kubernetes
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client

### Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

### AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb

# AWS EB
sudo apt-get install -y build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev
git clone git@github.com:aws/aws-elastic-beanstalk-cli-setup.git
./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

### Redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
make test
sudo cp src/redis-server /usr/local/bin/
sudo cp src/redis-cli /usr/local/bin/
cd ..

### DB
sudo apt-get install -y mysql-server libmysqlclient-dev

### Git pre-commit
pip install pre-commit
pre-commit --version

### TablePlus
# Add TablePlus GPG key
wget -qO - http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -

# Add TablePlus repo
sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"

# Install
sudo apt-get update
sudo apt-get install -y tableplus

