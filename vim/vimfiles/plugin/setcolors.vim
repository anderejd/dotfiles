" Less insane variant of: http://vim.wikia.com/wiki/VimTip341
"
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme

if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let s:colors = [] " set manually to override globpath listing

" https://stackoverflow.com/a/12739441/1506301
function! Rand()
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

function! NextColor(how)
  if len(s:colors) == 0
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:colors = map(paths, 'fnamemodify(v:val, ":t:r")')
  endif
  let i = 0
  if exists('g:colors_name')
    let i = index(s:colors, g:colors_name)
  else
    let i = -1
  endif
  let how = a:how
  let i += how
  if (0 == how)
    let i = Rand() % len(s:colors)
  endif
  if (i > len(s:colors) - 1)
    let i = 0
  elseif (i < 0)
    let i = len(s:colors) - 1
  endif
  let new_color = s:colors[i]
  try
    execute 'colorscheme '.new_color
  catch /E185:/
    echo 'Error: '.s:colors[i]
  endtry
  let g:colors_name = new_color " tolerate incorrect color scheme files
  redraw
  echo new_color
endfunction

nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

