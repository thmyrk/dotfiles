if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/.ebcli-virtual-env/executables
set -x EDITOR nvim
