:set number
:set relativenumber
:set hls
:set scrolloff=999
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set splitbelow
:set splitright
:syntax on
:set listchars=tab:▷▷⋮
:set invlist

" custom maping
" this part is for moving lines with <Ctrl + j/k>
nnoremap <C-j> :move .+1<CR>==
nnoremap <C-k> :move .-2<CR>==
inoremap <C-j> <ESC>:move .+1<CR>==gi
inoremap <C-k> <ESC>:move .-2<CR>==gi
vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv
