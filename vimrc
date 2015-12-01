" Disable compatibility with vi - required by Vundle
set nocompatible
" Turns off filetype while Vundle does its thing - required by Vundle
filetype off
" Sets Vundle runtime
set rtp+=~/.vim/bundle/Vundle.vim
" Initializes Vundle, run with :BundleInstall
call vundle#begin()
" List Vundle packages
Plugin 'gmarik/Vundle.vim'
Plugin 'gioele/vim-autoswap'
Plugin 'townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'Shutnik/jshint2.vim'
Plugin 'genoma/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'eapache/rainbow_parentheses.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/MatchTagAlways'
Plugin 'marijnh/tern_for_vim'
Plugin 'justinmk/vim-sneak'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region'
Plugin 'mattn/emmet-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'YankRing.vim'
Plugin 'rking/ag.vim'
Plugin 'osyo-manga/vim-over'
Plugin 'airblade/vim-gitgutter'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-wordy'
call vundle#end()
" Re-enable filetype when Vundle is done
filetype plugin indent on
" Enable syntax highlighting
syntax on
" Ignores case sensitivity, for smartcase
set ignorecase
" Incremental search
set incsearch
" Highlight search result
set hlsearch
" Enable mouse usage (all modes)
set mouse=a
" Use relative line numbers
set relativenumber
" except for current line
set number
" Enable smart case matching
set smartcase
" Keep encoding utf-8
set encoding=utf-8
set fileencoding=utf-8
" Backspace kills end of line and moves to previous
set backspace=indent,eol,start
" Keep buffers in the background when abandoned
set hidden
" ignore lots of files
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.mov,*.pdf,*.psd,*.ai
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xls,*.xlsx
" enable matchit plugin which ships with vim and enhances '%'
runtime macros/matchit.vim
" Show me what I'll do
set showcmd
" Enble autoread, requires :checktime to be run
set autoread
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END
" Use unix line endings
set fileformat=unix
" always show status bar
set laststatus=2
" only show status in status bar
set noshowmode
" autoindent based on line above
set autoindent
" use spaces instead of tabs (noexpandtab for opposite)
set expandtab
" for makefiles
autocmd FileType make set noexpandtab
" tabs are 2 spaces while reading and insert mode
set shiftwidth=2
set softtabstop=2
" size of a hard tabstop
set tabstop=2
" smarter indent for C-like languages
set smartindent
" show tabs with dashes and trailing spaces with dots
set listchars=tab:--,trail:·
set list
" keep cursor visible within 8 lines while scrolling
set scrolloff=8
" Swaps and backups go in tmp
set directory=~/.vim/tmp//
set backupdir=~/.vim/tmp//
" undo files and persistant undos
set history=1000
set undolevels=1000
set undoreload=10000
set undofile
set undodir=~/.vim/tmp/undo/
" JSHint on save
autocmd BufWritePost *.js silent :JSHint
" Specify syntax on certain filetypes
autocmd BufNewFile,BufRead *.md,*.markdown setlocal ft=markdown
autocmd BufNewFile,BufRead *.less setlocal ft=less
autocmd BufNewFile,BufRead *.scss setlocal ft=scss
" writing mode on markdown files
autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
autocmd BufRead,BufNewFile *.md,*.markdown setlocal wrap
" autocomplete words with spell check
set complete+=kspell
" Reload when entering buffer or gaining focus
au FocusGained,BufEnter * :silent! !
" Remove trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" Set current colorscheme (from .vim/colors/)
colorscheme molokai
" Set space as map leader
let mapleader = "\<Space>"
" map jj to esc
inoremap jj <ESC>
" clipboard bindings
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
" better ways to get to beginning and end of line
nnoremap H 0
nnoremap L $
" expand region visual by repeating v rather than +
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" map ,ev to edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" save with <leader>w
nnoremap <leader>w :w<CR>
" set vim-over command to leader f
nnoremap <leader>f :OverCommandLine<CR>
" toggle nerdtree with ctrl-o
map <C-o> :NERDTreeToggle %:p:h<CR>
" tab and shift-tab do proper thing
vmap <Tab> >gv
vmap <S-Tab> <gv
" Make Y behave like other Capitals (C, D, etc.)
noremap Y y$
" rainbow parens always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" dictionary path
set dictionary="/usr/dict/words"
" lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \  'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
" Swap lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" kill scratch buffer after selection is made
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" use eslint for syntastic
let g:syntastic_javascript_checkers = ['eslint']
" emmet expander
let g:user_emmet_expandabbr_key = '<c-y>'
" pencil config for prose
augroup pencil
  autocmd!
  autocmd FileType markdown,md call pencil#init()
  autocmd FileType txt         call pencil#init()
augroup END
"thesaurus
augroup lexical
  autocmd!
  autocmd FileType markdown,md call lexical#init()
  autocmd FileType txt call lexical#init({ 'spell': 0 })
augroup END
"lite autocorrect
augroup litecorrect
  autocmd!
  autocmd FileType markdown,md call litecorrect#init()
  autocmd FileType txt call litecorrect#init()
augroup END
" bring up thesaurus
let g:lexical#thesaurus_key = '<leader>t'
" ag alwyas starts from project root
let g:ag_working_path_mode="r"
" create yankring history file in vim dir
let g:yankring_history_dir="~/.vim/"
