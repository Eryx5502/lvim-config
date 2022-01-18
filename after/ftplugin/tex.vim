" Load defaults for text files
if !exists("b:textfile")
  runtime after/ftplugin/textfile.vim
endif
" insert mode shortcuts
inoremap <C-e> \emph{}<left>
inoremap <C-b> \textbf{}<left>
" Go to tab on enter (No longer used with coc-texlab gd)
"nnoremap <CR> <C-]>
"nnoremap <Bs> <C-T>
" Add $ to autopairs
"let b:autopairs_enabled = 0
let b:AutoPairs = {'(':')', '[':']', '{':'}','|':'|'}

" highlight Conceal guifg=#FF7733
" highlight Conceal guifg=#E6B673
"highlight SpellBad gui=undercurl guifg=#FF3333 guisp=Red
highlight SpellBad gui=undercurl guisp=Red

" make completion only after 3-letter words
lua require('cmp').setup.buffer({completion = {keyword_length = 3}})
