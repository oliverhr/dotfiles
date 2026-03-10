vim9script

# ======================= Plug Settings =======================================
# set the runtime path to include Vundle and initialize
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# =============================================================================

plug#begin()
  # - - - Utilities - - -
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'LunarWatcher/auto-pairs'
  Plug 'machakann/vim-sandwich'
  Plug 'nanotee/zoxide.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'luochen1990/rainbow'

  # LSP and Lint, Autocompletion and Formatting
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

  # - - - Syntax - - -
  # Plug 'dmix/elvish.vim', { 'on_ft': ['elvish'] }
  # Plug 'elixir-editors/vim-elixir'
  # Plug 'elkasztano/nushell-syntax-vim'
  # Plug 'fatih/vim-go'
  # Plug 'hashivim/vim-terraform'
  # Plug 'hashivim/vim-vagrant'
  # Plug 'leafgarland/typescript-vim'
  # Plug 'mattn/emmet-vim'
  # Plug 'pearofducks/ansible-vim'
  # Plug 'rescript-lang/vim-rescript'
  # Plug 'Tetralux/odin.vim'
  # Plug 'yasuhiroki/github-actions-yaml.vim'

  # - - - Colorschemes - - -
  Plug 'altercation/vim-colors-solarized',  { 'as': 'colors/solarized' }
  Plug 'catppuccin/vim',                    { 'as': 'colors/catppuccin' }
  Plug 'cormacrelf/vim-colors-github',      { 'as': 'colors/github' }
  Plug 'croaker/mustang-vim',               { 'as': 'colors/mustang' }
  Plug 'crusoexia/vim-monokai',             { 'as': 'colors/monokai' }
  Plug 'ghifarit53/tokyonight-vim',         { 'as': 'colors/tokyonight' }
  Plug 'jacoborus/tender.vim',              { 'as': 'colors/tender' }
  Plug 'joshdick/onedark.vim',              { 'as': 'colors/onedark' }
  Plug 'kaicataldo/material.vim',           { 'as': 'colors/material', 'branch': 'main' }
  Plug 'morhetz/gruvbox',                   { 'as': 'colors/gruvbox' }
  Plug 'NLKNguyen/papercolor-theme',        { 'as': 'colors/papercolor' }
  Plug 'nordtheme/vim',                     { 'as': 'colors/nord' }
  Plug 'rakr/vim-two-firewatch',            { 'as': 'colors/two-fire-watch' }
  Plug 'sonph/onehalf',                     { 'as': 'colors/onehalf', 'rtp': 'vim/' }
  Plug 'tyrannicaltoucan/vim-deep-space',   { 'as': 'colors/deepspace' }

  # - - - Loaded last - - -
  Plug 'ryanoasis/vim-devicons'
plug#end()


# -------------------------------------------------------------------
# Plugins Settings
# -------------------------------------------------------------------

# NerdTree
var NERDTreeIgnore = ['.git$[[dir]]']
var NERDTreeRespectWildIgnore = 1
g:NERDTreeQuitOnOpen = 3
g:NERDTreeWinPos = 'right'
g:NERDTreeWinSize = 40

autocmd BufEnter * {
  # Exit Vim if NERDTree is the only window remaining in the only tab.
  if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
    call feedkeys(':quit\<CR>:\<BS>')
  endif
}

# Enable using :RainbowToggle
g:rainbow_active = 0

# --- Language Protocol Server
g:lsp_settings = {
  # vim LSP has some issues with vim9script
  'vim-language-server': { 'disabled': true }
}

g:lsp_document_code_action_signs_enabled = 0
g:lsp_document_code_action_signs_hint = {'text': '⭲'}
g:lsp_diagnostics_signs_warning = {'text': '⚠'}
g:lsp_diagnostics_signs_error = {'text': '⌦'}
g:lsp_diagnostics_signs_hint = {'text': 'ℹ'}

