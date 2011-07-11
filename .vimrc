set nocompatible
"colorscheme twilight2
colorscheme topfunky-light
syntax on
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set autoread
set ruler
set history=25
set backspace=indent,eol,start
set hidden                        " Handle multiple buffers better.
set ts=4
set tw=78
set sw=4
set showmode
set showcmd
set visualbell
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wrap
set makeprg=gcc\ -g\ -o\ %:r\ %
set backup
set backupdir=/home/jac/vim_backup_files
set directory=/home/jac/vim_backup_files
set laststatus=2

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

filetype plugin indent on
autocmd FileType text setlocal textwidth=78
:filetype plugin on
:runtime! ftplugin/man.vim

abbr #b /************************************************
abbr #e ************************************************/

set vb t_vb=
set encoding=utf-8

au FileType ruby set nu sw=2 ts=2 expandtab
au FileType eruby set nu
au FileType python set et nu
