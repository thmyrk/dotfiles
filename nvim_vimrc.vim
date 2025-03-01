let mapleader = ","

filetype on

" --- Vim plug ---
call plug#begin("~/.config/nvim/bundle/")

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"

Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" --- File search ---
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
"

Plug 'mhinz/vim-startify'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'kshenoy/vim-signature'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
" Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'tommcdo/vim-exchange'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'tpope/vim-rails'
Plug 'vim-test/vim-test'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-endwise'
Plug 'posva/vim-vue'
Plug 'alvan/vim-closetag'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dag/vim-fish'
Plug 'gcmt/taboo.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/vim-glyph-palette'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set number
set mouse=
" set relativenumber
set autoindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
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
set shell=/usr/bin/fish
set sessionoptions-=options
set ignorecase

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

" Fold
set foldmethod=syntax
set nofoldenable

" Mappings
imap jj <Esc>
nmap <leader>s :cal cursor(0, len(getline('.')) / 2)<CR>
nmap <leader>a :cal cursor(0, len(getline('.')) / 4)<CR>
nmap <leader>d :cal cursor(0, (len(getline('.')) / 4) * 3)<CR>
nnoremap <CR> :noh<CR>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" --- Telescope ---
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" --- Fern ---
nmap <C-n> :Fern . -reveal=% -drawer<CR>

" --- Gruvbox ---
colorscheme gruvbox
set background=dark

" --- Rainbow ---
let g:rainbow_active = 1

filetype plugin indent on
syntax enable

" --- vim-test ---
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

let test#strategy = "neovim"
let g:test#neovim#start_normal = 1 " If using neovim strategy

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

" --- taboo ---
cabbrev tr TabooRename
set sessionoptions+=tabpages,globals

let g:taboo_tab_format = '%N %f%m '
let g:taboo_renamed_tab_format = '%N [%l]%m '

" --- coc ---
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750

" Fern
let g:fern#default_hidden = 1
let g:fern#renderer = "nerdfont"

" Glyph Palette
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fall-list call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" Silver searcher; Ag; Ack
let g:ackprg = 'ag --nogroup --column'
nmap <leader>g :Ack!<CR>
nmap <leader>h :Ack<Space>

" --- terminal emulator ---
tnoremap jj <C-\><C-n>

" --- tabs ---
nnoremap <leader>w gT
nnoremap <leader>e gt
nnoremap <leader>0 0gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>r0 :tabm 0<CR>
nnoremap <leader>r1 :tabm 1<CR>
nnoremap <leader>r2 :tabm 2<CR>
nnoremap <leader>r3 :tabm 3<CR>
nnoremap <leader>r4 :tabm 4<CR>
nnoremap <leader>r5 :tabm 5<CR>
nnoremap <leader>r6 :tabm 6<CR>
nnoremap <leader>r7 :tabm 7<CR>
nnoremap <leader>r8 :tabm 8<CR>
nnoremap <leader>r9 :tabm 9<CR>

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

" File <-> language associations
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
