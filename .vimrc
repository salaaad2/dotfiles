let mapleader=","

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Some basics:
	"set bg=light
	set go=a
	set mouse=a
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
	set ruler
	syntax on
	set hidden

" Enable autocompletion:
	set wildmode=longest,list,full

" Previous / next buffer
	noremap <silent> <C-k> :bprevious<CR>
	noremap <silent> <C-j> :bnext<CR>
	noremap <silent> <leader>w :w <BAR> :bp <BAR> :bd #<CR>

" Airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline_detect_modified = 1
	let g:airline_detect_paste = 1
	let g:airline_detect_crypt = 1
	let g:airline_theme = 'term'
	let g:airline_powerline_fonts = 1
	let g:airline_symbols_ascii = 1
	let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Cursor mode
	let g:airline#extensions#cursormode#enabled = 1
	let g:cursormode_color_map = {
	\	"i": 		"#7da9c7",
	\	"n": 		"#eac179",
	\	"R": 		"#bb5653",
	\	"r": 		"#bb5653",
	\	"v": 		"#b06597",
	\	"V": 		"#b06597",
	\	"\<C-V>":	"#b06597",
	\}

" 10 buffers jump
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	nmap <leader>1 <Plug>AirlineSelectTab1
	nmap <leader>2 <Plug>AirlineSelectTab2
	nmap <leader>3 <Plug>AirlineSelectTab3
	nmap <leader>4 <Plug>AirlineSelectTab4
	nmap <leader>5 <Plug>AirlineSelectTab5
	nmap <leader>6 <Plug>AirlineSelectTab6
	nmap <leader>7 <Plug>AirlineSelectTab7
	nmap <leader>8 <Plug>AirlineSelectTab8
	nmap <leader>9 <Plug>AirlineSelectTab9
	nmap <leader>0 <Plug>AirlineSelectTab10

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Powerline
	set laststatus=2
	set t_Co=256

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Compile document, be it groff/LaTeX/markdown/etc.
	"map <leader>c :w! \| !compiler <c-r>%<CR>
	autocmd BufWritePost *.tex !compiler %

" Compile C file
	autocmd FileType c noremap <F5> :w<CR> :!clear<CR> :!~/.vim/c/f5.sh;<CR>
	autocmd FileType c noremap <F6> :w<CR> :!clear<CR> :!~/.vim/c/f6.sh;<CR>
	autocmd FileType c noremap <F8> :w<CR>:!gcc<space>-Wall<space>-Wextra<space>-Werror %<CR>
	autocmd FileType c noremap <F9> :w<CR> :!clear<CR> :!~/.vim/c/f9.sh % 
	autocmd FileType c noremap <F10> :w<CR> :!clear<CR> :!~/.vim/c/f10.sh %<CR>

" Compile C++ file
	autocmd FileType cpp noremap <F5> :w<CR> :!clear<CR> :!~/.vim/cpp/f5.sh;<CR>
	autocmd FileType cpp noremap <F6> :w<CR> :!clear<CR> :!~/.vim/cpp/f6.sh;<CR>
	autocmd FileType cpp noremap <F8> :w<CR>:!g++<space>-Wall<space>-Wextra<space>-Werror %<CR>
	autocmd FileType cpp noremap <F9> :w<CR> :!clear<CR> :!~/.vim/cpp/f9.sh % 
	autocmd FileType cpp noremap <F10> :w<CR> :!clear<CR> :!~/.vim/cpp/f10.sh %<CR>
" === Comfy ===
" C
	autocmd FileType c inoremap " ""<left>
	autocmd FileType c inoremap ' ''<left>
	autocmd FileType c inoremap ( ()<left>
	autocmd FileType c inoremap [ []<left>
	autocmd FileType c inoremap { {}<left>
	autocmd FileType c inoremap < <><left>
	autocmd FileType c inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType c inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType c inoremap <<space> <<space>
	autocmd FileType c inoremap ><space> ><space>
	autocmd FileType c inoremap <= <=
	autocmd FileType c nnoremap <Leader>m o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType c nnoremap <Leader>M o#include<space><stdio.h><CR>#include<space><string.h><CR>#include<space><stdlib.h><CR>#include<space><stddef.h><CR>int<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>printf("NOT<space>ENOUGH<space>ARGS\n");<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>Oprintf();<left><left>

" C++
	autocmd FileType cpp noremap <silent> <F8> :w<CR>:!g++<space>-Wall<space>-Wextra<space>-Werror -O3 % <CR>
	autocmd FileType cpp noremap <F9> :w<CR>:!g++ -Wall -Wextra -Werror -O3 %; ./a.out  ; echo "~>\n\n.vimrc 2.3.1-release Tilde Edition by Joe"; rm a.out<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
	autocmd FileType cpp noremap <F10> :w<CR>:!g++ -Wall -Wextra -Werror -O3 %; ./a.out; echo "~>\n\n.vimrc 2.3.1-release Tilde Edition by Joe"; rm a.out<CR>
	autocmd FileType cpp inoremap " ""<left>
	autocmd FileType cpp inoremap ' ''<left>
	autocmd FileType cpp inoremap ( ()<left>
	autocmd FileType cpp inoremap [ []<left>
	autocmd FileType cpp inoremap { {}<left>
	autocmd FileType cpp inoremap < <><left>
	autocmd FileType cpp inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType cpp inoremap {;<CR> {<CR>};<ESC>O
	autocmd FileType cpp inoremap <<space> <<space>
	autocmd FileType cpp inoremap << <<<space>
	autocmd FileType cpp inoremap ><space> ><space>
	autocmd FileType cpp inoremap >> >><space>
	autocmd FileType cpp inoremap <= <=
	autocmd FileType cpp nnoremap <Leader>m oint<space>main(void)<space>{<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<CR>return<space>0;<CR>if<space>(argv[])<space>{}<CR>return<space>0;<CR>}<up><ESC>O
	autocmd FileType cpp nnoremap <Leader>M oint<space>main(int<space>argc,<space>char<space>*argv[])<space>{<CR>if<space>(argc<space>!=<space>1)<space>{<CR>cout<space><<<space>"NOT<space>ENOUGH<space>ARGS"<space><<<space>endl;<CR>return<space>1;<CR>}<CR>return<space>0;<CR>}<up><ESC>O

" = Web =
" HTML
	autocmd FileType html inoremap " ""<left>
	autocmd FileType html inoremap ' ''<left>
	autocmd FileType html inoremap ( ()<left>
	autocmd FileType html inoremap [ []<left>
	autocmd FileType html inoremap { {}<left>
	autocmd FileType html inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType html inoremap < <><left>

" PHP
	autocmd FileType php inoremap " ""<left>
	autocmd FileType php inoremap ' ''<left>
	autocmd FileType php inoremap ( ()<left>
	autocmd FileType php inoremap [ []<left>
	autocmd FileType php inoremap { {}<left>
	autocmd FileType php inoremap {<CR> {<CR>}<ESC>O
	autocmd FileType php inoremap < <><left>
	autocmd FileType php inoremap <? <?php  ?><left><left><left>
	autocmd FileType php inoremap <?<CR> <?php<CR>?><ESC>O

" CSS
	autocmd FileType css inoremap " ""<left>
	autocmd FileType css inoremap ' ''<left>
	autocmd FileType css inoremap ( ()<left>
	autocmd FileType css inoremap [ []<left>
	autocmd FileType css inoremap { {}<left>
	autocmd FileType css inoremap {<CR> {<CR>}<ESC>O


" Just in case
	inoremap " ""<left>
	inoremap ' ''<left>
	inoremap ( ()<left>
	inoremap [ []<left>
	inoremap { {}<left>
	inoremap "" ""
	inoremap '' ''
	inoremap () ()
	inoremap [] []
	inoremap {} {}
	inoremap <> <>

" .vimrc 2.4.1-release | Copyright Joe 2k19
