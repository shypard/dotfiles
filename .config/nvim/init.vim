" ~/.config/nvim/init.vim

" Basic Neovim settings
set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=80
set tw=79
set formatoptions+=t
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast
set list listchars+=space:. listchars-=eol:$
set encoding=UTF-8

" Sourcing the plugin manager and color scheme files
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/colors.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/vimtex.vim
source ~/.config/nvim/neoformat.vim
source ~/.config/nvim/deoplete.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/copilot.vim
