source ~/.config/nvim/packages.vim

"Neovim Config----------------------------
  "Colorscheme------{{{
    colorscheme gruvbox
    set background=dark
    syntax enable
  "-----------------}}}

  "Display----------{{{
    set norelativenumber number
    set noshowmode
    set guicursor=
    set nowrap
    set termguicolors 
    set foldmethod=marker
  "-----------------}}}

  "Search-----------{{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
  "-----------------}}}

  "Settings---------{{{
    set hidden
    set autoindent
    set smartindent
    set expandtab
    set tabstop=2     " Number of spaces a tab represents
    set shiftwidth=2  " Number of spaces >>, <<, and autoindent use
  "-----------------}}}

  "Mappings---------{{{
    let mapleader = " "
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>
    map <leader>i :tabe ~/.config/nvim/init.vim<CR>
    map <leader>s :so ~/.config/nvim/init.vim<CR>
    map <leader><leader> :Explore<CR>
    command! WQ wq
    command! Wq wq
    command! W w
    command! Q q
  "-----------------}}}
"-----------------------------------------

"Lightline Config-------------------------
  let g:lightline = {
  \  'colorscheme': 'seoul256',
  \  'active': {
  \     'left':[
  \        ['mode','paste'],
  \        ['readonly','filename','modified']
  \     ],
  \     'right':[
  \        ['fileformat','filencoding'],
  \        ['percent']
  \     ]
  \  }
  \}
"-----------------------------------------

"Deoplete Config--------------------------
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#max_list = 8
"-----------------------------------------

"Neomake Config---------------------------
"call neomake#configure#automake('nw', 1000)
"-----------------------------------------

"augroups---------------------------------
  augroup packager_filetype
    autocmd FileType go        packadd vim-go
    autocmd FileType markdown  packadd vim-pencil
  augroup END
"-----------------------------------------
