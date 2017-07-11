set encoding=utf-8

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set nowrap
set autochdir
set autoindent
set bs=2
set guioptions-=L
set guioptions-=R
set guioptions-=T
set guioptions-=l
set guioptions-=m
set guioptions-=r
set ignorecase
set laststatus=2
set noexpandtab
set noswapfile
set ruler
set sessionoptions-=options
set shiftwidth=8
set smartindent
set tabstop=8
" set guifont=Courier_New:h8:cANSI 
" set guifont=Courier\ 10\ Pitch\ 11

" Avoids updating the screen before commands are completed
set lazyredraw

" Remap navigation commands to center view on cursor using zz
nnoremap # #zz
nnoremap % %zz
nnoremap * *zz
nnoremap , @@zz
nnoremap <C-D> 11jzz
nnoremap <C-I> <C-I>zz
nnoremap <C-O> <C-O>zz
nnoremap <C-U> 11kzz
nnoremap G Gzz
nnoremap N Nzz
nnoremap gD gDzz
nnoremap gd gdzz
nnoremap gg ggzz
nnoremap j jzz
nnoremap k kzz
nnoremap n nzz
set scrolloff=0
set fillchars=

" Counter-Join current line from beginning of last word on current line
nnoremap <C-J> g_F<Space><Space>i<CR><Esc>k

syntax on
filetype on
colorscheme monokai_mod


" Called on most buffer switching events etc
function! SetBufferDefaults()
	setlocal cursorline
	match Conditional /[()\[\]\{\}]/
endfunction

augroup CursorLine
  au!
  " au VimEnter,WinEnter,BufWinEnter * setlocal cursorline 
  au VimEnter,WinEnter,BufWinEnter * call SetBufferDefaults()
  au WinLeave * setlocal nocursorline
  "au WinLeave * setlocal nocursorcolumn
augroup END


"hi CursorColumn                 ctermbg=LightGrey
"hi ColorColumn  cterm=NONE ctermbg=232 guibg=Black
hi clear ColorColumn
hi clear CursorLine
hi StatusLine ctermbg=NONE ctermfg=darkgrey
hi StatusLineNC ctermbg=NONE ctermfg=darkgrey
hi VertSplit ctermbg=NONE
hi CursorLine ctermbg=NONE
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
set colorcolumn=81
hi ColorColumn  cterm=NONE ctermbg=NONE guibg=NONE


let colorCounterGlobalVal = 234
function! NextColor()
	let g:colorCounterGlobalVal = g:colorCounterGlobalVal + 1
	echo g:colorCounterGlobalVal
	execute "hi ColorColumn ctermbg=" . g:colorCounterGlobalVal
endfunction
	
function! PrevColor()
	let g:colorCounterGlobalVal = g:colorCounterGlobalVal - 1
	if g:colorCounterGlobalVal < 0
		let g:colorCounterGlobalVal = 0
	endif
	echo g:colorCounterGlobalVal
	execute "hi ColorColumn ctermbg=" . g:colorCounterGlobalVal
endfunction
	
let colorColumnIsOn = 0
function! ToggleColorColumn()
	if g:colorColumnIsOn
		let g:colorColumnIsOn = 0
		execute "hi clear ColorColumn"
	else
		let g:colorColumnIsOn = 1
		execute "hi ColorColumn ctermbg=234"
	endif
endfunction

" nnoremap <C-L> :call NextColor()<CR>
" nnoremap <S-L> :call PrevColor()<CR>
nnoremap <C-L> :call ToggleColorColumn()<CR>

let g:netrw_sort_sequence='[\/]$,*'
nnoremap <C-c> <silent><C-c>




