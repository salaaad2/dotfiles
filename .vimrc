let mapleader=","

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'voldikss/vim-floaterm'
call plug#end()


set t_Co=256
"set background=dark

" Some basics:
	"set bg=light
	set go=a
"	set mouse=a
	set nohlsearch
	set clipboard=unnamedplus
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	nnoremap c "_c
	set nocompatible
	filetype plugin indent on
	set encoding=utf-8
	set number
	set relativenumber
	set ruler
	syntax on
	colo desert
	set hidden

" Enable autocompletion:
	set wildmode=longest,list,full

" Previous / next buffer
	noremap <silent> <C-k> :bprevious<CR>
	noremap <silent> <C-j> :bnext<CR>
	noremap <silent> <leader>w :w <BAR> :bp <BAR> :bd #<CR>

" Airline
"	let g:airline#extensions#tabline#enabled = 1
"	let g:airline#extensions#tabline#fnamemod = ':t'
"	let g:airline_detect_modified = 1
"	let g:airline_detect_paste = 1
"	let g:airline_detect_crypt = 1
"	let g:airline_theme = 'term'
"	let g:airline_powerline_fonts = 1
"	let g:airline_symbols_ascii = 1
"	let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Cursor mode
"	let g:airline#extensions#cursormode#enabled = 1
"	let g:cursormode_color_map = {
"	\	"i": 		"#7da9c7",
"	\	"n": 		"#eac179",
"	\	"R": 		"#bb5653",
"	\	"r": 		"#bb5653",
"	\	"v": 		"#b06597",
"	\	"V": 		"#b06597",
"	\	"\<C-V>":	"#b06597",
"	\}


" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Powerline
	set laststatus=2
	set t_Co=256

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %
" Floaterm
nnoremap <silent> <F7> :FloatermNew <CR>
" Startify
let g:startify_custom_header_quotes = [
			\ ['Hey man'],
			\ ['How are you ?'],
			\ ['Happy coding'],
			\]


"CCLS /LSP
" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.ccls'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

nn <silent> <M-d> :LspDefinition<cr>
nn <silent> <M-r> :LspReferences<cr>
nn <f2> :LspRename<cr>
nn <silent> <M-a> :LspWorkspaceSymbol<cr>
nn <silent> <M-l> :LspDocumentSymbol<cr>

" Compile document, be it groff/LaTeX/markdown/etc.
	"map <leader>c :w! \| !compiler <c-r>%<CR>
	autocmd BufWritePost *.tex !compiler %

" Compile C file
	noremap <F5> :w<CR> :!make -j5 ASAN=1;<CR>
	noremap <F6> :w<CR> :!./cub3d "map/map_one.cub"; ret=$?; echo "~> $ret\n\n.vimrc 3.0-release Tilde Edition by Joe\n";<CR>
	autocmd FileType c noremap <F8> :w<CR>:!gcc<space>-Wall<space>-Wextra<space>-Werror %<CR>
	autocmd FileType c noremap <F9> :w<CR> :!clear<CR> :!~/.vim/c/f9.sh % 
	autocmd FileType c noremap <F10> :w<CR> :!clear<CR> :!~/.vim/c/f10.sh %<CR>

" Compile C++ file
	autocmd FileType cpp noremap <F8> :w<CR>:!g++<space>-Wall<space>-Wextra<space>-Werror %<CR>
	autocmd FileType cpp noremap <F9> :w<CR> :!clear<CR> :!~/.vim/cpp/f9.sh % 
	autocmd FileType cpp noremap <F10> :w<CR> :!clear<CR> :!~/.vim/cpp/f10.sh %<CR>
" === Comfy ===
" C
	"autocmd FileType c inoremap " ""<left>
	"autocmd FileType c inoremap ' ''<left>
	"autocmd FileType c inoremap ( ()<left>
	"autocmd FileType c inoremap [ []<left>
	"autocmd FileType c inoremap { {}<left>
	"autocmd FileType c inoremap < <><left>
	"autocmd FileType c inoremap {<CR> {<CR>}<ESC>O
	"autocmd FileType c inoremap {;<CR> {<CR>};<ESC>O
	"autocmd FileType c inoremap <<space> <<space>
	"autocmd FileType c inoremap ><space> ><space>
	"autocmd FileType c inoremap <= <=
	autocmd FileType c nnoremap <Leader>m o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType c nnoremap <Leader>M o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>printf("NOT<space>ENOUGH<space>ARGS\n");<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>Oprintf();<left><left>

" C++
	autocmd FileType cpp noremap <silent> <F8> :w<CR>:!g++<space>-Wall<space>-Wextra<space>-Werror -O3 % <CR>
	autocmd FileType cpp noremap <F9> :w<CR>:!g++ -Wall -Wextra -Werror -O3 %; ./a.out  ; echo "~>\n\n.vimrc 2.3.1-release Tilde Edition by Joe"; rm a.out<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
	autocmd FileType cpp noremap <F10> :w<CR>:!g++ -Wall -Wextra -Werror -O3 %; ./a.out; echo "~>\n\n.vimrc 2.3.1-release Tilde Edition by Joe"; rm a.out<CR>
	""autocmd FileType cpp inoremap " ""<left>
	""autocmd FileType cpp inoremap ' ''<left>
	""autocmd FileType cpp inoremap ( ()<left>
	""autocmd FileType cpp inoremap [ []<left>
	""autocmd FileType cpp inoremap { {}<left>
	""autocmd FileType cpp inoremap < <><left>
	""autocmd FileType cpp inoremap {<CR> {<CR>}<ESC>O
	""autocmd FileType cpp inoremap {;<CR> {<CR>};<ESC>O
	""autocmd FileType cpp inoremap <<space> <<space>
	""autocmd FileType cpp inoremap << <<<space>
	""autocmd FileType cpp inoremap ><space> ><space>
	""autocmd FileType cpp inoremap >> >><space>
	""autocmd FileType cpp inoremap <= <=
	autocmd FileType cpp nnoremap <Leader>m oint<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<CR>return<space>0;<CR>if<space>(argv[])<space>{}<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>cout<space><<<space>"NOT<space>ENOUGH<space>ARGS"<space><<<space>endl;<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>O
