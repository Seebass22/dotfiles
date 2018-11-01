"vundle stuff:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'dylanaraps/wal.vim'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'machakann/vim-highlightedyank'

Plugin 'tpope/vim-fugitive'

Plugin 'PotatoesMaster/i3-vim-syntax'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"actual vimrc:
set number
set relativenumber
set nocompatible
set ignorecase
set smartcase
set breakindent
set hidden
"set showbreak=\\\\\
syntax on
filetype indent on
filetype plugin on 

"set background=light
colorscheme wal

" search as characters are entered
set incsearch

" highlight matches
"set hlsearch

" better command line completion
set wildmenu

" highlight current line
"set cursorline

"indentation settings for using 4 spaces instead of tabs. 
"does not change tabstop from its default value of 8.
"set shiftwidth=4
"set softtabstop=4
"set expandtab

"Indentation settings for using hard tabs for indent.
"Display tabs as four characters wide
set shiftwidth=4
set tabstop=4

" toggles between paste and nopaste
"set pastetoggle=<F2> 

let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep='>'
"let g:airline_right_sep='<'

"invisible characters
set listchars=tab:▸\ ,eol:¬

if has('nvim')
	set inccommand=nosplit
endif

"bind to remove trailing spaces after lines (do not use on vimrc)
"nnoremap <F5> :%s/\s\+$//e

"inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
nnoremap <Space><space> /<++><Enter>"_c4l
nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

command Octave !octave --no-gui %
