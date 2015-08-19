" Tevin's personal vimrc file.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" NeoBundle Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'

" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
" NeoBundle 'flazz/vim-colorschemes'


NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'SirVer/ultisnips'   " Snippet engine
NeoBundle 'honza/vim-snippets' " Snippets
NeoBundle 'tpope/vim-fugitive' " Git itegration
NeoBundle 'Valloric/YouCompleteMe',  {
      \ 'build' : {
      \     'mac' : './install.sh',
      \    },
      \ }
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tell-k/vim-autopep8'
" NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-rsi'


" Theme
NeoBundle 'chriskempson/base16-vim'

" Syntax
NeoBundle 'othree/html5.vim'
NeoBundle 'saltstack/salt-vim'
NeoBundle 'sprsquish/thrift.vim'
NeoBundle 'Glench/Vim-Jinja2-Syntax'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" End NeoBundle Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't use Ex mode, use Q for formatting
" map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" if !exists(":DiffOrig")
"   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
"           \ | wincmd p | diffthis
" endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Environment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

set guifont=Source\ Code\ Pro:h16


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set noswapfile
set history=1000 " keep 1000 lines of command line history

" undo
set undofile            " persistent undo
set undolevels=1000     " maximum number of changes that can be undone
set undoreload=10000    " maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo
" backup
set backupdir=~/.vim/backup
set undodir=~/.vim/undo

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftwidth=4
set expandtab  " translate tab to spaces

"let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5

set showcmd    " display incomplete commands
set incsearch  " Find as you type search

set scrolljump=5   " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor

set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uppercase present
set autoread                   " Auto reload file on change
" set virtualedit=onemore        " allow cursor beyond last character


set list                                         " Show trailing whitespace
" set listchars=tab:>-,trail:-
set listchars=tab:\|·,trail:·


" search for visually selected text with //
vnoremap // y/<C-R>"<CR>"

autocmd! BufWritePost ~/.vimrc source ~/.vimrc  " When vimrc is edited, reload it


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
 set mouse=a
endif


" for copy and paste
vmap <C-c> "+y
vmap <C-c> "+y

" git gutter
set updatetime=750         " faster gutter update

" Airline
set laststatus=2           " always show airline
let g:airline_left_sep=''  " no fancy sep
let g:airline_right_sep='' " no fancy sep

" Theme
set background=dark
let base16colorspace=256
colorscheme base16-ocean

let g:ctrlp_use_caching = 0
" let g:ctrlp_working_path_mode = 'c'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" ignore in ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


let mapleader = "\<Space>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Basic Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number

" Copy & paste to system clipboard with <Space>p and <Space>y:
nnoremap <leader>y "+y
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" Enter visual line mode with <Space><Space>
nmap <leader><leader> V


nnoremap <leader>c :noh<CR>

nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']


let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:AutoClosePairs = "() {} \""

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>r :Ag!
nnoremap <leader>3 :AgFromSearch<CR>

"Do not fix these errors/warnings (default: E226,E24,W6)
" let g:autopep8_ignore="E501,W293"
let g:syntastic_python_flake8_args = "--max-line-length=80"

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" File
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType python set foldmethod=indent|set foldlevel=99
autocmd FileType python set cc=80

" Indent Fixes
    autocmd FileType css,less,html,jinja,javascript,php,puppet,yaml set shiftwidth=2
    autocmd FileType css,less,html,jinja,javascript,php,puppet,yaml set tabstop=2
    autocmd FileType css,less,html,jinja,javascript,php,puppet,yaml set softtabstop=2
