if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/.ebcli-virtual-env/executables
set -x PATH $PATH ~/go/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/.local-python-environment/bin
set -x EDITOR nvim

thefuck --alias | source
