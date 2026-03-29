vim9script

if has('autocmd')
  augroup GeneralEditorBehavior
    autocmd!

    # Return to last edit position when opening files
    autocmd BufReadPost * {
      if &filetype != 'gitcommit'
        if line("'\"") > 0 && line("'\"") <= line('$')
          exe "normal! g`\""
        endif
      endif
    }

    # Auto-cleanup for all traling whitespace on buffer saving
    autocmd BufWritePre * {
        var curr_view = winsaveview()
        keeppatterns :%s/\s\+$//e
        winrestview(curr_view)
    }
  augroup END

  augroup GitCommitSettings
    autocmd!

    # Set local options and move cursor to line 1, column 1
    autocmd FileType gitcommit {
        setlocal spell nofoldenable textwidth=72
        cursor(1, 1)
    }
    autocmd BufWinLeave COMMIT_EDITMSG bdelete
  augroup END

  augroup FileTypeSettings
    autocmd!

    # C/C++
    autocmd Filetype c,cpp setlocal noexpandtab sw=4 ts=4 cinoptions+=L0

    # Four spaces
    autocmd Filetype python,ruby,php setlocal expandtab sw=4 ts=4

    # Two spaces
    autocmd Filetype json,javascript,typescript,html setlocal expandtab sw=2 ts=2

    # These are better with wraps
    autocmd Filetype yaml setlocal expandtab sw=2 ts=2 sts=2 wrap
    autocmd Filetype markdown setlocal expandtab sw=2 ts=2 wrap linebreak

    # Real tabs
    autocmd FileType sh,bash,go setlocal noexpandtab ci pi sts=0 sw=4 ts=4

    # XML files Indent with tabs, align with spaces
    autocmd FileType xml setlocal noet ci pi sts=0 sw=2 ts=2

    # OCAML
    # set rtp^=~/.opam/default/share/ocp-indent/vim
  augroup END

  # Templates for new buffers
  augroup templates
    autocmd BufNewFile *.sh 0 read <sfile>:h/skeletons/bash.sh
    autocmd BufNewFile *.py 0 read <sfile>:h/skeletons/python.py
  augroup END
endif

# vim: set ft=vim ts=2 sw=2 et :
