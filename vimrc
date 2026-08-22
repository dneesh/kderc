" ==============================================================================
" vimrc
" ==============================================================================
" Ref:
" 1. vimrc_example.vim
" 2. https://chrisyeh96.github.io/2017/12/18/vimrc.html
" ==============================================================================

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" persistent undo
if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file (restore to previous version)
	if has('persistent_undo')
		set undofile	" keep an undo file (undo changes after closing)
	endif
endif

" put swap and backup files in a separate folder
" Ref: https://vi.stackexchange.com/questions/16037/vim-swap-file-best-practices
set directory^=$HOME/.vim/swap//
set backupdir^=$HOME/.vim/backup//

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	au!
	" For all text files set 'textwidth' to 80 characters.
	autocmd FileType text setlocal textwidth=80
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
	packadd! matchit
endif

" ==============================================================================
" basic wraps
" ==============================================================================
set number
set wrap
set wildmenu
set showmatch
set laststatus=2
set ruler
set visualbell
set mouse-=a

" filetype-based syntax highlighting
syntax enable
filetype plugin indent on

" Tab settings
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent

" ==============================================================================
" search
" ==============================================================================
set incsearch
set hlsearch
nnoremap ,<SPACE> :nohls<CR>
 
" ==============================================================================
" cursor
" ==============================================================================
set cursorlineopt=line
highlight CursorColumn ctermbg=236
highlight CursorLine ctermbg=236 cterm=bold

function! ToggleCursorHighlight()
	if &cursorline || &cursorcolumn
		set nocursorline
		set nocursorcolumn
	else
		set cursorline
		set cursorcolumn
	endif
endfunction

nnoremap <leader>c :call ToggleCursorHighlight()<CR>
" ==============================================================================

" Helpful
set autoread " auto-reload file in Vim if it has been changed outside vim


" ==============================================================================
" Plugins go here
" ==============================================================================

" vim plug
" automatic installation of vim-plug
" Ref: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

" -- autopairs
Plug 'jiangmiao/auto-pairs'

" -- nerd-tree
Plug 'preservim/nerdtree'
let NERDTreeShowHidden=1
nmap <F2> :NERDTreeToggle<CR><C-w>p
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
let g:NERDTreeFileLines = 1

" -- vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'light'

" -- colorscheme --

" enfocado
Plug 'wuelnerdotexe/vim-enfocado'
let g:enfocado_style = 'nature'

call plug#end()
" ==============================================================================

set termguicolors
" Auto-set background to light from 6 AM - 6 PM
" function! SetBackgroundBasedOnTime()
"     let l:hour = str2nr(strftime("%H"))
"     if l:hour >= 18 || l:hour < 6
"         set background=dark
"     else
"         set background=light
"     endif
" endfunction
set background=dark

augroup BackgroundAutoSet
    autocmd!
    autocmd VimEnter * call SetBackgroundBasedOnTime()
augroup END

colorscheme enfocado

