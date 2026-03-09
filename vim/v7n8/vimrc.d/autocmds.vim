" vim: set ft=vim ts=2 sw=2 et :

if has('autocmd')

  augroup GeneralEditorBehavior
    autocmd!

    " Return to last edit position when opening files
    autocmd BufReadPost * call RestoreCursorPosition()

    " Remove all traling whitespace at buffer saving
    autocmd BufWritePre * call CleanTrailingWhitespace()
  augroup END

  augroup GitCommitSettings
    autocmd!

    " Always start on the first line
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
    " Standard commit settings
    autocmd FileType gitcommit setlocal spell nofoldenable textwidth=72
    " Clean up buffer on leave
    autocmd BufWinLeave COMMIT_EDITMSG bdelete
  augroup END

  augroup FileTypeSettings
    autocmd!

    autocmd Filetype c,cpp set noexpandtab sw=4 ts=4 cinoptions+=L0
    autocmd Filetype python,ruby,php set expandtab sw=4 ts=4
    autocmd Filetype json,javascript,typescript,html set expandtab sw=2 ts=2

    autocmd Filetype yaml set expandtab sw=2 ts=2 sts=2 wrap
    autocmd Filetype markdown set expandtab sw=2 ts=2 wrap linebreak

    " Shell files Indent with tabs, align with spaces
    autocmd FileType sh,bash set noet ci pi sts=0 sw=4 ts=4

    " Go files Indent with tabs, align with spaces
    autocmd FileType go set noet ci pi sts=0 sw=4 ts=4

    " XML files Indent with tabs, align with spaces
    autocmd FileType xml set noet ci pi sts=0 sw=2 ts=2

    " Dockerfiles force tabs to use HereDocs on RUN commands
    autocmd Filetype dockerfile set noexpandtab sw=4 ts=4 sts=4 nowrap

    " Ocaml
    set rtp^=~/.opam/default/share/ocp-indent/vim
  augroup END

endif

