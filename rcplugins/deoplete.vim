let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

inoremap <expr><c-h> deoplete#smart_close_popup()."\<c-h>"
inoremap <expr><bs>  deoplete#smart_close_popup()."\<c-h>"
inoremap <silent><cr> <c-r>=<sid>my_cr_function()<cr>
imap <expr><tab>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

smap <expr><tab> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

function! s:my_cr_function() abort
  return pumvisible() ? "\<c-y>" : "\<cr>"
endfunction
