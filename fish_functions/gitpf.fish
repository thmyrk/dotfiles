function gitpf
  pass ssh --clip && git push origin HEAD --force-with-lease
end
