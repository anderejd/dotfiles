" Config file for neovim-qt.

colorscheme Base2Tone_EveningDark
GuiFont DejaVu Sans Mono:h12
set scrolloff=999
set textwidth=80

nnoremap <silent> <F11> :call GuiWindowFullScreen((g:GuiWindowFullScreen + 1) % 2)<cr>

