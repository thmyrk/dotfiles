let mapleader = ","

set nocompatible              " be iMproved, required
filetype off                  " required

" --- Vundle ---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhinz/vim-startify'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'kshenoy/vim-signature'
Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'
Plugin 'easymotion'
Plugin 'ryanoasis/vim-devicons'
Plugin 'luochen1990/rainbow'
Plugin 'tommcdo/vim-exchange'

call vundle#end()

" --- CtrlP ---
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_map = '<leader>f'
nmap <leader>t :CtrlPTag<CR>

" --- NERDTree ---
let NERDTreeShowHidden=1
nmap <C-n> :NERDTree<CR>

" --- Syntastic ---
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" --- Gruvbox ---
colorscheme gruvbox
set background=dark

" --- VimDevicons ---
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

" --- Rainbow ---
let g:rainbow_active = 1

filetype plugin indent on
syntax enable

set number
" set relativenumber
set autoindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set wildmenu
set wildmode=list:longest,full
set complete-=i
set lazyredraw
set list!
set incsearch
set laststatus=2
set ruler
set scrolloff=2
set sidescrolloff=5
set display+=lastline
set encoding=utf-8
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set formatoptions+=j
set shell=/bin/zsh
set sessionoptions-=options
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Cursor highlighting
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
" set colorcolumn=120

" Line Wrapping
set nowrap
set linebreak " Wrap at word
set showbreak=…

" Autosave
set autowrite
set autoread

" Mappings
imap jj <Esc>
nmap <C-g> :TagbarToggle<CR>
nmap <leader>s :cal cursor(0, len(getline('.')) / 2)<CR>
nmap <leader>a :cal cursor(0, len(getline('.')) / 4)<CR>
nmap <leader>d :cal cursor(0, (len(getline('.')) / 4) * 3)<CR>

function! <SID>StripTrailingWhitespaces()
  if mode() == 'n'
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endif
endfunction

if has('autocmd')
  augroup buffer_filetype_autocmds
    au!
    autocmd FileType html let g:html_indent_strict=1
    autocmd BufEnter {Gemfile,Rakefile,Guardfile,Capfile,Vagrantfile,Thorfile,config.ru,*.rabl,*.caracal} setfiletype ruby
    autocmd BufEnter *.template setfiletype json
    autocmd BufEnter *.j setfiletype objc
    autocmd BufEnter *.md setfiletype markdown
    autocmd BufEnter *.yml.sample setfiletype yaml
    autocmd BufWritePre ?* :call <SID>StripTrailingWhitespaces()
  augroup END
endif
