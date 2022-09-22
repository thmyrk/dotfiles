# dotfiles

My configs

## Ansible provision playbook
Prerequisites:
* ansible
* git cloned this repo
* `ansible-galaxy collection install kewlfft.aur` for Archlinux os family

Run `ansible-playbook -K ansible/setup-linux.yml`

Things you have to do manually:
* terminal / workspaces keyboard shortcuts
* set DroidSansMono as terminal font
* run Neovim configuration `nvim +'source nvim_config.vim'`
