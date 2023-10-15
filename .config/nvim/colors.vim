" ~/.config/nvim/colors.vim

if (has("termguicolors"))
  set termguicolors
endif

" Enable gruvbox colors
set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
