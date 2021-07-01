" C++ settings
"
" setup for c++ compilation
autocmd filetype cpp nnoremap <F5> :w <bar>!g++ -Wshadow -Wextra -Wall "%" -o "%:r" -g -fsanitize=address -D DEBUG -fsanitize=undefined<cr>
autocmd filetype cpp nnoremap <F4> :w <bar>!./"%:r"<cr>
autocmd filetype cpp nnoremap ,run :w <bar>!./"%:r"<cr>
" C++ snippets mappings
autocmd filetype cpp nnoremap ,usamain :-1read /home/mike0609king/.vim/vim/snippets/C++/USACO_main.cpp<cr>2jA
autocmd filetype cpp nnoremap ,main :-1read /home/mike0609king/.vim/vim/snippets/C++/standard_main.cpp<cr>4jA
autocmd filetype cpp nnoremap ,debug :-1read /home/mike0609king/.vim/vim/snippets/C++/Debug.cpp<cr>
