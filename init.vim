set nocompatible "Turn off compatibility mode
syntax on "Enable syntax highlighting
filetype indent plugin on "Turns on indent and plugin detection for files

set termguicolors
set visualbell "Use visual bell instead of beeping when doing something wrong
set hidden "Allow switching files in the same window using an unsaved buffer
set wildmenu "Better command-line completion
set showcmd "Show partial commands in the last line of the screen
set hlsearch "Turn on highlighting for searching

"Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

"Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

set autoindent "When opening a new line and no filetype-specific indenting is enabled, keep the same indent as the line you're currently on. Useful for READMEs, etc.
set nostartofline "Stop certain movements from always going to the first character of a line.

set confirm "Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.

set number "Display line numbers on the left
set relativenumber "Use relative numbers


" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab "Exand tabs into spaces

"------------------------------------------------------------
"Mappings

"Map leader to spacebar
let mapleader = "\<Space>"

"Move between split windows more easily
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-l> <C-W>l

inoremap <C-H> <C-\><C-N><C-W>h
inoremap <C-J> <C-\><C-N><C-W>j
inoremap <C-K> <C-\><C-N><C-W>k
inoremap <C-l> <C-\><C-N><C-W>l

tnoremap <C-H> <C-\><C-N><C-W>h
tnoremap <C-J> <C-\><C-N><C-W>j
tnoremap <C-K> <C-\><C-N><C-W>k
tnoremap <C-l> <C-\><C-N><C-W>l
tnoremap <Esc> <C-\><C-N>

"Manipulate Splits
nnoremap _ <C-W><bar>
nnoremap <bar> <C-W>_
tnoremap _ <C-W><bar>
tnoremap <bar> <C-W>_

"Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" Easy motion mappings
map <Leader><Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Open NERD Tree using a keyboard shortcut
map <C-E> :NERDTreeToggle<CR>

"Map toggle comments to ctrl+/
nmap <C-_> <Plug>NERDCommenterToggle

"Map toggle comments to ctrl+/ and regain selection in visual mode
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"Coc (Autocomplete Mappings)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"------------------------------------------------------------
" Plugins

" automatically install plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'pangloss/vim-javascript' "Improved javascript syntax highlighting
  Plug 'townk/vim-autoclose'
  Plug 'mattn/emmet-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Install FZF globally and add vim wrapper
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree' "NERDTree is a file browser plugin
  Plug 'scrooloose/nerdcommenter' "Comment code with a keybinding
  Plug 'yggdroot/indentline'
  Plug 'sheerun/vim-polyglot' "Multiple language packages for vim
  Plug 'kien/rainbow_parentheses.vim' "Enable rainbow parentheses
  Plug 'ap/vim-css-color' "Enable colored highling to CSS colours eg #FFF
  Plug 'tpope/vim-surround'  
  Plug 'airblade/vim-gitgutter' "Show the Git diff in the gutter
  Plug 'easymotion/vim-easymotion'
  Plug 'ryanoasis/vim-devicons' "Adds file type glyphs/icons to popular Vim plugins
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Enables colors for nerdtree
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
  Plug 'karlrombauts/vim-material'
  Plug 'vim-airline/vim-airline' "Enable airline status bar at the bottom of the screen
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive' "Git wrapper for vim
  Plug 'mbbill/undotree' "Magic undo features
  Plug 'mileszs/ack.vim' "GREP replacement
  Plug 'brooth/far.vim' "Find and replace plugin
call plug#end()

"------------------------------------------------------------
"Plugin Settings
let g:material_style='oceanic'
set background=dark
colorscheme vim-material

" Airline
let g:airline_theme='material'
let g:airline_section_b="%{FugitiveStatusline()}"

"Automatically start NERD Tree when vim is opened without a file selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" If it is available use Silver Searcher with Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Git Gutter
set updatetime=250
let g:gitgutter_max_signs = 500
"No mapping
let g:gitgutter_map_keys = 0
"Colors
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn

highlight GitGutterAdd    guifg=#C3E88D ctermfg=2
highlight GitGutterChange guifg=#FFCB6B ctermfg=3
highlight GitGutterDelete guifg=#FF5370 ctermfg=1

"Autocommenter settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

"Prettier Format on save
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0

"Prettier default settings
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#config_precedence = 'prefer-file'
