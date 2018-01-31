" Smash escape (deactivate <esc>)
inoremap <silent>jk <esc>
inoremap <esc> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
" Fuzzy file search
nnoremap <silent><c-p> :Files<cr>
" Fuzzy fulltext search
nnoremap <leader>/ :Ag<cr>
" List of open buffers
nnoremap <leader><enter> :Buffers<cr>
" Save current buffer
nnoremap <leader>w :w<cr>
" reload config
nnoremap <leader>so :so $MYVIMRC<cr>
" dein.vim mappings
nnoremap <leader>du :call dein#install()<cr>
" Quickstart search
noremap ;; :%s:::g<left><left><left>
noremap ;' :%s:::cg<left><left><left><left>
" Reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv
" sane infile searching
nnoremap / /\v
nnoremap :s/ :s/\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v
" toggle search highlights
nnoremap <bs> :set hlsearch! hlsearch?<cr>
" Utility
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *<c-o>
nnoremap <leader>lc :lclose<cr>
" window management
nnoremap <leader>s <c-w>s
nnoremap <leader>v <c-w>v<c-w>l
" bring up undo history tree
nnoremap <leader>u :UndotreeToggle<cr>
" Whitespace
nnoremap <leader>ff :call Preserve("normal gg=G")<cr>
" Formatting
nnoremap <leader>ft :ALEFix<cr>

let g:move_key_modifier = 'c'

" Smooth scrolling buffers
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<cr>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<cr>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<cr>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<cr>
