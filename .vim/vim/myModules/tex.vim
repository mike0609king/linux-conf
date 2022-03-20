" LaTeX settings
set grepprg=grep\ -nH\ $*	" recommended from website
let g:tex_flavor='latex' 	" recommended from website
let g:Imap_FreezeImap=1		" no auto mapping from which I dont know...
autocmd filetype tex set wm=2	" sets a wrap margin of 2 characters from the right window border
autocmd filetype tex setlocal indentexpr=
" LaTeX mappings
autocmd filetype tex nnoremap <F5> :w<bar>:b1<bar>:!pdflatex "%"<cr>:b#<cr>
autocmd filetype tex nnoremap <F4> :w<bar>:b1<bar>:!pdflatex "%"<cr>:b#<cr>
autocmd filetype tex nnoremap ,open :!zathura "%:r".pdf &<cr>
autocmd filetype tex set spell
autocmd filetype tex set spell spelllang=en_us
" mapping special characters
" autocmd filetype tex inoremap \"o ö
" autocmd filetype tex inoremap \"u ü
" autocmd filetype tex inoremap \"a ä
" autocmd filetype tex inoremap \ss ß
" autocmd filetype tex inoremap \"O Ö 
" autocmd filetype tex inoremap \"U Ü
" autocmd filetype tex inoremap \"A Ä
" Latex snippets mappings
autocmd filetype tex nnoremap ,main :-1read $HOME/.vim/vim/snippets/LaTeX/main.tex <bar> :!cp -r /home/mike0609king/.vim/vim/snippets/LaTeX/myDefaultPackageSetup/ . && chmod -R +w myDefaultPackageSetup && mkdir includings && chmod -R +w includings<cr><cr>
autocmd filetype tex nnoremap ,bmain :-1read $HOME/.vim/vim/snippets/LaTeX/bmain.tex <bar> :!cp -r /home/mike0609king/.vim/vim/snippets/LaTeX/myDefaultPackageSetup/ . && chmod -R +w myDefaultPackageSetup && mkdir includings && chmod -R +w includings<cr><cr>
