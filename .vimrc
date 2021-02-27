" Vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'ycm-core/YouCompleteMe'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

call plug#end()

" Dracula Config
let g:dracula_italic = 0
let g:dracula_colorterm = 0

" Prettier Config
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#tab_width = '4'
let g:prettier#autoformat = 1

colorscheme dracula
syntax enable	


" Mappings
nnoremap <silent> K :call CocAction('doHover')<CR>
" Jump to end in Insert Mode
inoremap <C-e> <C-o>$ 

" Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType json syntax match Comment +\/\/.\+$+

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
