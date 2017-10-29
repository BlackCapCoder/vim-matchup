" vim match-up - matchit replacement and more
"
" Maintainer: Andy Massimino
" Email:      a@normed.space
"

function! matchup#misc#init_module() " {{{1
  command! MatchupReload          call matchup#misc#reload()
  nnoremap <plug>(matchup-reload) :<c-u>MatchupReload<cr>
endfunction

" }}}1

" {{{1 function! matchup#misc#reload()
if get(s:, 'reload_guard', 1)
  function! matchup#misc#reload() abort
    let s:reload_guard = 0

    for l:file in glob(fnamemodify(s:file, ':h') . '/../**/*.vim', 0, 1)
      execute 'source' l:file
    endfor

    call matchup#init()

    unlet s:reload_guard
  endfunction
endif

let s:file = expand('<sfile>')

" vim: fdm=marker sw=2