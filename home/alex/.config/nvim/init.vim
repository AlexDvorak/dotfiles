"Toggles------------
set nocompatible
set norelativenumber number
set nowrap
set noshowmatch     " Don't do the annoying jump to the matching bracket when closing bracket is typed
set termguicolors

set splitbelow " More natural split behavior
set splitright

set hlsearch
set incsearch
set ignorecase

set smartcase     " Override 'ignorecase' option if search pattern contains uppercase letters
set tabstop=4     " Number of spaces a tab represents
set shiftwidth=4  " Number of spaces >>, <<, and autoindent use
set expandtab     " Insert correct number of spaces instead of a tab when tab key is pressed

"Keymappings--------
let mapleader="\<SPACE>"
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

"Packages-----------
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
let dein_cache_dir = '~/.config/nvim/dein/'
"-------------
if dein#load_state(dein_cache_dir)
  call dein#begin(dein_cache_dir)
  call dein#add(dein_cache_dir.'repos/github.com/Shougo/dein.vim')

  call dein#add('haya14busa/dein-command.vim')

  call dein#add('Shougo/deoplete.nvim' )
  call dein#add('cocopon/vaffle.vim'   )
  call dein#add('preservim/nerdtree'   )
  call dein#add('itchyny/lightline.vim')
  call dein#add('rust-lang/rust.vim'   )
  call dein#add('vmchale/ion-vim'      )
  call dein#add('udalov/kotlin-vim'    )

  call dein#add('tpope/vim-fugitive')
  call dein#add('co1ncidence/gunmetal.vim')
  call dein#add('casperstorm/sort-hvid.vim')
  call dein#add('habamax/vim-gruvbit')

  call dein#end()
  call dein#save_state()
endif
"-------------
set bg=dark
colorscheme gunmetal-grey

function CleanPackages()
    call map(dein#check_clean(), "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endfunction

"Package Config-----
let g:deoplete#enable_at_startup = 1
let NERDTreeHijackNetrw = 0
let g:lightline = {
\    'colorscheme': 'one',
\    'active': {
\        'right':[ ['fileformat','filencoding'], ['percent'] ]
\    }
\}

"AutoCommands-----

