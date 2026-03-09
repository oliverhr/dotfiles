vim9script

source common.vim
source plugins.vim
source mappings.vim
source appearance.vim
source experiments.vim

if has('win64')
  source windows.vim
elseif has('osx')
  source macos.vim
else
  source linux.vim
endif