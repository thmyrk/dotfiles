function! nvim_config#SetupPlug()
  execute 'PlugInstall'

  return 1
endfunction

call nvim_config#SetupPlug()

execute 'qall'
