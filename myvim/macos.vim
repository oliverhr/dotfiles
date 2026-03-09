vim9script

# macOS specific configurations

# Terminal mappings
nnoremap <silent> <leader>tp :ter ++close<cr>
nnoremap <silent> <leader>ts :ter ++noclose<cr>

# RUNNING ON A TERMINAL - Terminal specific settings (ignoring colorscheme)
if ! has('gui_running')
  # MacOS Terminal
  if match($TERM_PROGRAM, '\cApple_Terminal') != -1
    set notermguicolors
    set t_Co=256
    set background=dark
    if !empty($VIM_COLOR)
      # colorscheme $VIM_COLOR
    else
      set t_Co=24
      # colorscheme solarized
    endif

  # iTerm
  elseif match($TERM_PROGRAM, '\ciTerm') != -1
    if match($ITERM_PROFILE, '\cCatpuccino') != -1
        # colorscheme catppuccin_macchiato
        # g:airline_theme = 'catppuccin_macchiato'
        highlight Normal ctermbg=none
    elseif match($ITERM_PROFILE, '\cTokyonight') != -1
        # g:tokyonight_style = 'night' # available: night, storm
        # g:tokyonight_enable_italic = 1
        # colorscheme tokyonight
    elseif match($ITERM_PROFILE, '\cMonokai') != -1
        # colorscheme monokai
    elseif match($ITERM_PROFILE, '\cMaterial') != -1
        # g:material_terminal_italics = 1
        # g:material_theme_style = 'default'
        # colorscheme material
        highlight CursorLine guibg=#37474F
    elseif match($ITERM_PROFILE, '\cDark') != -1
        # colorscheme PaperColor
        # g:airline_theme = 'minimalist'
    elseif match($ITERM_PROFILE, '\cLight') != -1
        set notermguicolors
        set background=light
        # colorscheme Solarized
    else
        set background=light
        # colorscheme quiet
    endif

  # WezTerm
  elseif match($TERM_PROGRAM, '\cWezterm') != -1
    set background=dark
    # colorscheme tokyonight

  # Rio
  elseif match($TERM_PROGRAM, '\cRio') != -1
    set background=dark
    # colorscheme tokyonight

  # Kitty
  elseif match($TERM_PROGRAM, '\cKitty') != -1
    set background=dark
    # colorscheme tokyonight

  # Ghostty
  elseif match($TERM_PROGRAM, '\cGhostty') != -1
    set background=dark
    # colorscheme catppuccin_macchiato

  # Alacritty
  elseif match($TERM_PROGRAM, '\cAlacritty') != -1
    set background=dark
    # colorscheme deep-space

  # Tmux
  elseif match($TERM_PROGRAM, '\cTmux') != -1
    set background=dark
    # color onedark
    # g:airline_theme = 'zenburn'

  else
    set background=dark
    # color quiet
    # Set Tab bar color background to translucid and line to black
    highlight TabLineFill ctermfg=Black
  endif

  # Override all and set color dynamically
  if !empty($VIM_COLOR)
    # colorscheme $VIM_COLOR
  endif
endif