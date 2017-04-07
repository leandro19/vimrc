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
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
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

let g:airline_theme='dark'

" Get base16 colors from shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

syntax on
inoremap jk <esc>
colorscheme base16-3024
set cursorline
let base16colorspace=256
hi CursorLine   cterm=NONE ctermbg=236 ctermfg=NONE
"hi CursorLine   cterm=NONE ctermbg=52 ctermfg=NONE
set number
set autoindent
set smartindent
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set laststatus=2
set ttimeoutlen=50
set mouse=a

" disables opaque background                                                
hi Normal ctermbg=none
hi NonText ctermbg=none

let g:Tex_ViewRule_pdf = 'evince'
"No tmux auto-paste:
"let &t_SI .= "\<Esc>[?2004h"
"let &t_EI .= "\<Esc>[?2004l"
"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"
"function! XTermPasteBegin()
"  set pastetoggle=<Esc>[201~
"  set paste
"  return ""
"endfunction

"With tmux auto-paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

let g:airline_powerline_fonts = 1

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_loc_list_height = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_c_checkers = ['avrgcc', 'checkpatch', 'clang_check', 'clang_tidy', 'cppcheck', 'gcc', 'make', 'oclint', 'pc_lint', 'sparse', 'splint']
let g:syntastic_cpp_checkers = ['avrgcc', 'clang_check', 'clang_tidy', 'cppcheck', 'cpplint', 'gcc', 'oclint', 'pc_lint', 'verapp']
let g:syntastic_cs_checkers = ['mcs']
let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_javascript_checkers = ['closurecompiler', 'eslint', 'flow', 'gjslint', 'jsl', 'jscs', 'jshint', 'jslint', 'jsxhint', 'mixedindentlint', 'standard', 'tern_lint']
let g:syntastic_python_checkers = ['flake8', 'frosted', 'mypy', 'prospector', 'py3kwarn', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylama', 'pylint', 'python']
"let g:syntastic_mode_map = { 'passive_filetypes': ['tex']  }

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
