function! PackagerInit()
  "Init---------------
  packadd vim-packager
  call packager#init()

  "packager/start
    call packager#add('trevordmiller/nova-vim')
    call packager#add('rakr/vim-two-firewatch')
    call packager#add('arcticicestudio/nord-vim')

    call packager#add('itchyny/lightline.vim')
    call packager#add('airblade/vim-gitgutter')
    call packager#add('preservim/nerdtree')

    call packager#add('Shougo/deoplete.nvim')
    call packager#add('editorconfig/editorconfig-vim')
    call packager#add('udalov/kotlin-vim')

  "packager/opt
    call packager#add('reedes/vim-pencil',           {'type':'opt'})
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
