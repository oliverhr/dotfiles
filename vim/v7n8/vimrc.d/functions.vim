" vim: set ft=vim ts=2 sw=2 et :

" ================ Helper Functions ==================

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr('%')
  let l:alternateBufNum = bufnr('#')

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr('%') == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute('bdelete! '.l:currentBufNum)
  endif
endfunction


" Remove trailing white space (this dont remove empty lines)
function! CleanTrailingWhitespace()
  let l:curr_view = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:curr_view)
endfunction

function! RestoreCursorPosition()
  if &filetype != 'gitcommit'
    \ && line("'\"") > 1
    \ && line("'\"") <= line("$")
    execute "normal! g`\""
  endif
endfunction

