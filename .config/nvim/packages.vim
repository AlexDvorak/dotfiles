function! PackagerInit()
  "Init---------------
  packadd vim-packager
  call packager#init()

  "packager/start
    call packager#add('morhetz/gruvbox')
    call packager#add('itchyny/lightline.vim')
    call packager#add('airblade/vim-gitgutter')
    call packager#add('Shougo/deoplete.nvim')
    call packager#add('editorconfig/editorconfig-vim')

  "packager/opt
    call packager#add('takac/vim-hardtime',          {'type':'opt'})
    call packager#add('fatih/vim-go',                {'type':'opt'})
    call packager#add('kristijanhusak/vim-packager', {'type':'opt'})

  call packager#install()

endfunction

if !exists("pack_init")
  echo "Started vim-packager"
  let pack_init = jobstart('PackagerInit')
else
  echo "Not running vim-packager more than once"
endif


command! PackagerInstall call packager#install()
command! PackagerClean   call packager#clean()
command! PackagerStatus  call packager#status()
command! -bang PackagerUpdate call packager#update({ 'force_hooks': '<bang>' })
