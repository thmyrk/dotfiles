function! nvim_config#SetupPlug()
  execute 'PlugInstall'

  return 1
endfunction

function! nvim_config#SetupCoc()
  execute 'CocInstall -sync coc-json coc-solargraph'

  return 1
endfunction

call nvim_config#SetupPlug()
call nvim_config#SetupCoc()

execute 'qall'
