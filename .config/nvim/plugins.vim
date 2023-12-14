" ~/.config/nvim/plugins.vim

call plug#begin("~/.vim/plugged")
  Plug 'sbdchd/neoformat'
  Plug 'sainnhe/gruvbox-material'
  Plug 'ryanoasis/vim-devicons'
  Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'lervag/vimtex'
  Plug 'github/copilot.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tpope/vim-fugitive'
"  Plug 'dense-analysis/ale'
"  Plug 'deoplete-plugins/deoplete-jedi'
"  Plug 'deoplete-plugins/deoplete-clang'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'itchyny/vim-highlighturl'
call plug#end()
