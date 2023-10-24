" ~/.config/nvim/neoformat.vim

" neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 0
let g:neoformat_basic_format_trim = 1
let g:neoformat_c_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['-style=file'],
    \ 'stdin': 1
    \ }

let g:neoformat_tex_latexindent = {
    \ 'exe': 'latexindent',
    \ 'args': ['--local --modifylinebreaks'],
    \ 'stdin': 1
    \ }

" create shortcut for neoformat
nnoremap <leader>f :Neoformat<CR>
