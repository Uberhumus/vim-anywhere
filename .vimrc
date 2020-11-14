"Set Color scheme
colorscheme default

"Show line numbers
set number

"Set tabs to be 4 spaces
set tabstop=4 shiftwidth=4 expandtab

"Hide rather than close files when moving to new buffer
set hidden

"Highlight Search results
set hlsearch

"Remap Ctrl+ {h,j,k,l} for movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Make splitting look more intuitive
set splitbelow
set splitright

"Perserve folds between sessions
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"Always show PWS in status line
set laststatus=2
"set statusline=%!getcwd()
set statusline+=%F

"Make YCM cleanup after itself, specifically make it close the buffer suggestion when done.
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

"Shortcut the tabnext command to nt
cabbr nt tabnext

"Setting encoding to UTF-8 by request of YouCompleteMe
set encoding=utf-8
