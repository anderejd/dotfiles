" Config file for neovim-qt. Sourced after init.vim.

colorscheme Base2Tone_EveningDark
hi Comment guifg=#555588
hi SpecialComment guifg=#555588
GuiFont DejaVu Sans Mono:h12
nnoremap <silent> <F11> :call GuiWindowFullScreen((g:GuiWindowFullScreen + 1) % 2)<cr>

