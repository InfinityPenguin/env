" Useful tips:
" 	- 'gi': insert at previous insert position
"	- 'Ctrl-C', 'Ctrl-[': <Esc>
" 	- '*', '#': search occurences of word under cursor
" 	- 'ci<bracket>': change inner brackets; bracket can be any of [{(<"'`
" 	- '/\u': search for next uppercase character
" 	- ':shell' to launch a shell from Vim
" 	- ':66,75<command>': apply <command> from lines 66 to 75 ':66,75s/^/#'
" 	- ':E': netrw, native Vim file explorer
" 		- 'v': split
" 		- 'o': open

" Spacing
set backspace=2
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
" set paste / set nopaste" toggle paste mode

" hybrid lining
set number relativenumber

" encryption method
setlocal cm=blowfish2

colorscheme zellner

" Does not set the background color; tells Vim what the background color is
set background=light 

" Show matching brackets
set showmatch 
set nu

set showcmd

" Navigation between word-wrapped lines
" :map j gj 
" :map k gk

" Share system clipboard
set clipboard=unnamed

" Date insertion shortcut
nmap <F3> i<C-R>=strftime("# %m-%d-%Y %a")<CR><Esc>
imap <F3> <C-R>=strftime("# %m-%d-%Y %a")<CR>

" Time insertion shortcut
nmap <F4> i<C-R>=strftime("## %I:%M %p")<CR><Esc>
imap <F4> <C-R>=strftime("## %I:%M %p")<CR>

syntax on


" Avoid colons, semi-colons, escape button
nnoremap ; : 
nnoremap ;1 :!
nnoremap ;w :w!<return>
nnoremap ;q :q!<return>
nnoremap ;x :x!<return>
inoremap fj <esc>

set mouse=a " enable mouse in Vim
set wrap lbr
let g:html_indent_inctags = "html,body,head,tbody"

" Encoding
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h11
set guifontwide=NSimsun:h12

" These two prevent .swp files and ~ files from appearing in the working folder.  Requires a vimtmp directory in the home folder
set backupdir=~/vimtmp,. 
set directory=~/vimtmp,.

" CtrlP accessibility
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Code extension to be added to plugin/ctrlp.vim; allows text insertion of ctrlp search result as a relative path
function! CtrlPOpenFunc(action, line)
	if a:action =~ '^h$'    
		" 	Get the filename
		let filename = fnameescape(fnamemodify(a:line, ''))
		let filename = join(['- [', filename, '](', filename, ')'], '')

		" Close CtrlP
		call ctrlp#exit()
		call ctrlp#mrufiles#add(filename)

		" insert the contents of filename into the buffer
		put =filename
		" join filename with previous line to handle extra newline, then move cursor to end
		silent normal kJA
		call call('ctrlp#acceptfile', [a:action, a:line])
	else    
		" Use CtrlP's default file opening function
		call call('ctrlp#acceptfile', [a:action, a:line])
	endif
endfunction

let g:ctrlp_open_func = { 
			\ 'files': 'CtrlPOpenFunc',
			\ 'mru files': 'CtrlPOpenFunc' 
			\ }


" NERDTree accessibility
map <C-n> :NERDTree<return>

" able to close Vim when NerdTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

" NERDTree opens on startup
" autocmd vimenter * NERDTree

" Disable default markdown folding
let g:vim_markdown_folding_disabled = 1

" Vundle configurations
set nocompatible              
filetype off                  

" Option 1: Set the runtime path to include Vundle and initialize

" 	set rtp+=~/.vim/bundle/Vundle.vim
"	call vundle#begin()

" Option 2: Pass a path where Vundle should install plugins
 set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
 call vundle#begin('$HOME/vimfiles/bundle/')

" Keep Plugin commands between vundle#begin/end.

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " File navigation
" Plugin 'groenewege/vim-less' " Vim syntax for LESS
" Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finding

" support md syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown' 

" The following are examples of different formats supported:
" Plugin from GitHub repo
" 	Plugin 'tpope/vim-fugitive' " Git wrapper
" 	Plugin 'Shougo/unite.vim' " Unification omnibar for searching

" Plugin from http://vim-scripts.org/vim/scripts.html
" 	Plugin 'L9' "Code-editing plugin

" Git plugin not hosted on GitHub
" 	Plugin 'git://git.wincent.com/command-t.git'

" Git repos on your local machine (i.e. when working on your own plugin)
" 	Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" 	Pass the path to set the runtimepath properly.
" 	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" 	Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" To delete a plugin, open 'PluginList', highlight the plugin, and type 'D'

" see :h vundle for more details or wiki for FAQ

" Install Plugins:
" 1. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2. Launch Vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall
