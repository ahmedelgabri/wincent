" TODO: port to Lua

function s:RemoveBg(group)
  let l:highlight=filter(luaeval("require'wincent.pinnacle'.dump(_A)", a:group), 'v:key != "bg"')
  execute 'highlight! clear ' . a:group
  execute 'highlight! ' . a:group . ' ' . luaeval("require'wincent.pinnacle'.highlight(_A)", l:highlight)
endfunction

function s:CheckColorScheme()
  let s:config_file = expand('~/.zsh/.base16')

  if filereadable(s:config_file)
    let s:config = readfile(s:config_file, '', 2)

    if s:config[1] =~# '^dark\|light$'
      execute 'set background=' . s:config[1]
    else
      echoerr 'Bad background ' . s:config[1] . ' in ' . s:config_file
    endif

    if filereadable(expand('~/.config/nvim/colors/base16-' . s:config[0] . '.lua'))
      execute 'colorscheme base16-' . s:config[0]
    else
      echoerr 'Bad scheme ' . s:config[0] . ' in ' . s:config_file
    endif
  else " default
    set background=dark
    colorscheme base16-bright
  endif

  execute 'highlight Comment ' . luaeval("require'wincent.pinnacle'.italicize('Comment')")

  " Hide (or at least make less obvious) the EndOfBuffer region
  highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

  " Grey, just like we used to get with https://github.com/Yggdroot/indentLine
  if &background ==# 'light'
    let s:conceal_term_fg=249
    let s:conceal_gui_fg='Grey70'
  else
    let s:conceal_term_fg=239
    let s:conceal_gui_fg='Grey30'
  endif
  highlight clear Conceal
  execute 'highlight Conceal ' .
        \ 'ctermfg=' . s:conceal_term_fg
        \ 'guifg=' . s:conceal_gui_fg

  highlight clear NonText
  highlight link NonText Conceal

  highlight clear CursorLineNr
  execute 'highlight CursorLineNr ' . luaeval("require'wincent.pinnacle'.extract_highlight('DiffText')")

  highlight clear Pmenu
  highlight link Pmenu Visual

  " See :help 'pb'.
  highlight PmenuSel blend=0

  highlight clear DiffDelete
  highlight link DiffDelete Conceal
  highlight clear VertSplit
  highlight link VertSplit LineNr

  " Resolve clashes with ColorColumn.
  " Instead of linking to Normal (which has a higher priority, link to nothing).
  highlight link vimUserFunc NONE

  " For Git commits, suppress the background of these groups:
  for l:group in ['DiffAdded', 'DiffFile', 'DiffNewFile', 'DiffLine', 'DiffRemoved']
    call s:RemoveBg(l:group)
  endfor

  " More subtle highlighting during merge conflict resolution.
  highlight clear DiffAdd
  highlight clear DiffChange
  highlight clear DiffText

  let l:highlight=luaeval("require'wincent.pinnacle'.italicize('ModeMsg')")
  execute 'highlight User8 ' . l:highlight

  " Allow for overrides:
  " - `statusline.vim` will re-set User1, User2 etc.
  " - `after/plugin/loupe.vim` will override Search.
  doautocmd ColorScheme
endfunction

if v:progname !=# 'vi'
  augroup WincentAutocolor
    autocmd!
    autocmd FocusGained * call s:CheckColorScheme()
  augroup END

  if !exists('$TMUX')
    " In tmux we're going to get a `FocusGained` event on launch, but not when
    " outside of it.
    call s:CheckColorScheme()
  endif
endif
