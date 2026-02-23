" ==============================================================================
" Task
" ==============================================================================
" Vim [8]
" tpd=$HOME/.config/vim/pack/$USER/start/gotask/plugin                                                                                   ─╯
" mkdir -p $tpd
" cp task.v9s.vim $tpd
"
" Vim [7 & 8]
" cp task.v7s.vim ~/.vim/plugin/
" ==============================================================================

" Fully compatible with Vim 7.x and Vim 8.x
function! s:GoTask(...)
    " a:000 contains all arguments passed via <f-args>
    let l:args = a:000
    let l:original_win = winnr()

    " Handle empty arguments (just running :Task)
    let l:escaped_list = map(copy(l:args), 'shellescape(v:val)')
    let l:cmd = 'task ' . join(l:escaped_list, ' ')

    let l:result = system(l:cmd)

    if empty(l:result)
        echom "Task: Command executed (no output)."
        return
    endif

    " Open the split
    botright 10new

    " Settings
    setlocal filetype=text
    setlocal buftype=nofile bufhidden=wipe noswapfile nonumber

    " Fill the buffer
    call setline(1, split(l:result, '\n'))
    setlocal nomodifiable

    " Close and return to original window
    execute 'nnoremap <buffer><silent> q :bwipeout!<CR>:' . l:original_win . 'wincmd w<CR>'
endfunction

" The command definition
command! -nargs=* Task call s:GoTask(<f-args>)

" vim: set ft=vim ts=2 sw=2 et :
