set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"  alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
"  let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'conradirwin/vim-bracketed-paste'
Plugin 'ervandew/supertab'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"  plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
"  plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"  Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
"  git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
"  The sparkup vim script is in a subdirectory of this repo called vim.
"  Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"  Install L9 and avoid a Naming conflict if you've already installed a
"  different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
"  All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"  To ignore plugin indent changes, instead use:
" filetype plugin on
" 
"  Brief help
"  :PluginList       - lists configured plugins
"  :PluginInstall    - installs plugins; append `!` to update or just
"  :PluginUpdate
"  :PluginSearch foo - searches for foo; append `!` to refresh local cache
"  :PluginClean      - confirms removal of unused plugins; append `!` to
"  auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline_theme='murmur'

imap jk <esc>
imap JK <esc>
cmap jk <C-c>
cmap JK <C-c>
colorscheme elflord

"row/column highlight settings
"set cursorline
"set cursorcolumn
"hi CursorLine   cterm=NONE ctermbg=236 ctermfg=NONE
"hi CursorColumn   cterm=NONE ctermbg=236 ctermfg=NONE

"syntax highlighting and tab spacing
syntax on
set number
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set laststatus=2
set ttimeoutlen=50

" disables opaque background                                                
hi Normal ctermbg=none
hi NonText ctermbg=none

"Vim-latex pdf viewer
let g:Tex_ViewRule_pdf = 'evince'

"let g:airline_powerline_fonts = 1

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on (commented out because it's already on)
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
