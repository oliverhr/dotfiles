vim9script

# =============================================================================
# Task
# ==============================================================================
# tpd=$HOME/.config/vim/pack/$USER/start/gotask/plugin                                                                                   ─╯
# mkdir -p $tpd
# cp task.v9s.vim $tpd
# ==============================================================================

def GoTask(...args: list<string>): void
  # Capture the current window so we can jump back later
  var original_win = win_getid()

  var escaped_args = mapnew(args, (_, val) => shellescape(val))
  var cmd = 'task ' .. join(escaped_args, ' ')

  # Debugging message
  echom 'Executing: ' .. cmd

  # Execute the command
  var result = system(cmd)

  if empty(result)
      echom "Task: Command executed (no output)."
      return
  endif

  # Open the bottom split
  botright :10new

  # Buffer settings
  setlocal filetype=text
  setlocal buftype=nofile bufhidden=wipe noswapfile nonumber

  # Fill the buffer
  setline(1, split(result, '\n'))
  setlocal nomodifiable

  # Closes the buffer and returns focus
  execute 'nnoremap <buffer><silent> q :bwipeout!<CR>:call win_gotoid(' .. original_win .. ')<CR>'
enddef

# Define the command without 'call'
command! -nargs=* Task GoTask(<f-args>)

# vim: set ft=vim ts=2 sw=2 et :
