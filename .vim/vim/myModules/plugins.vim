call plug#begin('~/.vim/plugged')

" Auto completion
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'vim-latex/vim-latex'
Plug 'alvan/vim-closetag'

" file managing
Plug 'kevinhwang91/rnvimr'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" snippets (use vim-snippets for reference but don't install it)
Plug 'SirVer/ultisnips'

" Looks of vim
Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color' " display colors

call plug#end()

" ################################################
" #             coc configurations               #
" ################################################
" extentions
" remove: CocUninstall <extention-name>
" CocInstall coc-pyright
"\ 'coc-python',
"\ 'coc-vimtex',
" ################################################

let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-tsserver',
    \]

" coc-pairs
"
let b:coc_pairs_disabled = ['<']
autocmd FileType tex let b:coc_pairs = [["$", "$"], ["(", ")"], ["[", "]"], ["{", "}"]]
set runtimepath+=~/.vim/plugged/coc.nvim/plugin/coc.vim

" completely disable coc for certain files
" autocmd filetype cpp set runtimepath-=~/.vim/plugged/coc.nvim
" autocmd filetype python set runtimepath-=~/.vim/plugged/coc.nvim
" autocmd filetype tex set runtimepath-=~/.vim/plugged/coc.nvim

" coc-<language> --> completion
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" navigation in the completion list with <Tab> and <S-Tab>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()							" navigation with <Tab>
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"	" navigation with <S-Tab>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"		" confirm completion with <cr> (space) 

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" GoTo code navigation 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ################################################
" #        vim-closetag configurations           #
" ################################################

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.xml,*.js,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,xml,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" ################################################
" #          color scheme configurations         #
" ################################################
"colorscheme gruvbox
"let g:gruvbox_guisp_fallback="bg"
set background=dark

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

" ################################################
" #            nerdtree configurations           #
" ################################################
nnoremap <leader>n :NERDTreeToggle<bar>:set relativenumber<cr>

" ################################################
" #            airline configurations            #
" ################################################
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.css"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.css"
    endif
  endif
endfunction

nnoremap <F9> :call JumpToCSS()<CR>

" ################################################
" #               fzf configurations             #
" ################################################
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>

" ################################################
" #            nerdtree configurations           #
" ################################################

" setting my own directory for snippets
set runtimepath+=~/.vim

" ...
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
