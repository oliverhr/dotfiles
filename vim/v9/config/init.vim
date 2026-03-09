vim9script

source $MYVIMDIR/config/common.vim
source $MYVIMDIR/config/plugins.vim
source $MYVIMDIR/config/mappings.vim
source $MYVIMDIR/config/appearance.vim

if has('win64')
  source $MYVIMDIR/config/windows.vim
elseif has('osx')
  source $MYVIMDIR/config/macos.vim
else
  source $MYVIMDIR/config/linux.vim
endif

# Visual patch
highlight clear FoldColumn

