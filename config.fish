if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/.ebcli-virtual-env/executables
set -x PATH $PATH ~/go/bin
set -x EDITOR nvim

function envsource
  for line in (cat $argv | grep -v '^#')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] $item[2]
    echo "Exported key $item[1]"
  end
end
