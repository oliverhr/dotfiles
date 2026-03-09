" vim: set ft=vim ts=2 sw=2 et :
" =========================    Plug Settings    ================================
" set the runtime path to include Vundle and initialize
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

" - - - Utilities - - -
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'cohama/lexima.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " LSP and Lint, Autocompletion and Formatting
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

  " - - - Syntax - - -
  " Plug 'pearofducks/ansible-vim'

  " - - - Colorschemes - - -
  Plug 'altercation/vim-colors-solarized',  { 'as': 'colors/solarized' }
  Plug 'catppuccin/vim',                    { 'as': 'colors/catppuccin' }
  Plug 'cormacrelf/vim-colors-github',      { 'as': 'colors/github' }
  Plug 'croaker/mustang-vim',               { 'as': 'colors/mustang' }
  Plug 'crusoexia/vim-monokai',             { 'as': 'colors/monokai' }
  Plug 'ghifarit53/tokyonight-vim',         { 'as': 'colors/tokyonight' }
  Plug 'jacoborus/tender.vim',              { 'as': 'colors/tender' }
  Plug 'joshdick/onedark.vim',              { 'as': 'colors/onedark' }
  Plug 'morhetz/gruvbox',                   { 'as': 'colors/gruvbox' }
  Plug 'NLKNguyen/papercolor-theme',        { 'as': 'colors/papercolor' }
  Plug 'nordtheme/vim',                     { 'as': 'colors/nord' }
  Plug 'sainnhe/sonokai',                   { 'as': 'colors/sonokai'}
  Plug 'tyrannicaltoucan/vim-deep-space',   { 'as': 'colors/deepspace'}

  " - - - Loaded last - - -
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" -------------------------------------------------------------------
" Plugins Settings
" -------------------------------------------------------------------
let NERDTreeIgnore = ['.git$[[dir]]']
let g:NERDTreeQuitOnOpen = 3
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 40
let NERDTreeRespectWildIgnore = 1

