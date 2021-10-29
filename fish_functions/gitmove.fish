function gitmove
  git branch -f $argv[1] && git checkout $argv[1]
end
