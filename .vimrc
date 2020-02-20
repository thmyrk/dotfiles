let mapleader = ","

set nocompatible              " be iMproved, required
filetype off                  " required

" Explicitly set shell to bash. Fixes issues with fish (non-posix)
set shell="bash"

" --- Vundle ---
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle/")

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
Plugin 'tomlion/vim-solidity'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tpope/vim-rails'
Plugin 'elmcast/elm-vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'posva/vim-vue'
Plugin 'alvan/vim-closetag'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'rust-lang/rust.vim'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

" --- CtrlP ---
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules
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
let g:syntastic_solidity_checkers = ['solc', 'solium']

let g:elm_syntastic_show_warnings = 1

" --- elm-vim ---
let g:elm_setup_keybindings = 0

" --- Gruvbox ---
colorscheme gruvbox
set background=dark

" --- VimDevicons ---
set guifont=DroidSansMono\ Nerd\ Font:h11

" --- Rainbow ---
let g:rainbow_active = 1

filetype plugin indent on
syntax enable

" --- Seeing is believing ---
let g:xmpfilter_cmd = "seeing_is_believing"
autocmd FileType ruby nmap <buffer> <leader>z <Plug>(seeing_is_believing-mark)
autocmd FileType ruby xmap <buffer> <leader>z <Plug>(seeing_is_believing-mark)
autocmd FileType ruby nmap <buffer> <leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby nmap <buffer> <leader>x <Plug>(seeing_is_believing-run)
autocmd FileType ruby xmap <buffer> <leader>x <Plug>(seeing_is_believing-run)

" --- vim-closetag ---
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,vue'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" --- terminal emulator ---
tnoremap jj <C-\><C-n>

" --- tabs ---
nnoremap <leader>w gT
nnoremap <leader>e gt
nnoremap <leader>r0 :tabm 0<CR>
nnoremap <leader>r1 :tabm 1<CR>
nnoremap <leader>r2 :tabm 2<CR>
nnoremap <leader>r3 :tabm 3<CR>

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
set colorcolumn=150

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
nnoremap <CR> :noh<CR>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

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
