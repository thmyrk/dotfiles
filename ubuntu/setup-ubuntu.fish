#!/bin/fish

### Ruby
# Depending on your version of Ubuntu/Debian/Mint, libgdbm6 won't be available.
# In that case, try an earlier version such as libgdbm5.
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

ln -s ~/workspace/dotfiles/.default_gems ~/.default_gems

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

### Node
sudo apt-get install -y dirmngr gpg curl

asdf plugin add node https://github.com/asdf-vm/asdf-nodejs
asdf install node latest
asdf global node latest

### Rails related requirements
# sudo apt-get install install libpq-dev

### Fzf, The_silver_searcher
sudo apt-get install fzf
echo fzf_key_bindings > ~/.config/fish/functions/fish_user_key_bindings.fish

sudo apt-get install silversearcher-ag
