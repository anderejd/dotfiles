function! OverrideColorscheme()
	hi MatchParen ctermfg=200 ctermbg=0
endfunction

autocmd! ColorScheme * :call OverrideColorscheme()
set scrolloff=999
set textwidth=80
set cursorline
set nowrap
nnoremap <C-h> :set hlsearch!<CR>
colorscheme Base2Tone_ForestDark

