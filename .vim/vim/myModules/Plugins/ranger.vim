" ################################################
" #        ranger(rnvimr) configurations         #
" ################################################
nnoremap <C-n> :RnvimrToggle<cr>

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 0
" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1
