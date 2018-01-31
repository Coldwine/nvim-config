augroup fileType
  autocmd!
augroup END

autocmd fileType BufNewFile,BufReadPost *.md set filetype=markdown
autocmd fileType BufNewFile,BufReadPost *stylelintrc set filetype=json
autocmd fileType BufNewFile,BufReadPost inspircd.conf set filetype=xml
autocmd fileType BufNewFile,BufReadPost *ctags set filetype=config
autocmd fileType BufNewFile,BufReadPost *thymerc set filetype=ruby
autocmd fileType BufNewFile,BufReadPost mail set tabwidth=76
autocmd fileType FileType help nnoremap <buffer> q :q<cr>
autocmd fileType FileType javascript :iabbrev <buffer> iff if()<left>
autocmd fileType FileType css,scss setlocal iskeyword+=-
autocmd fileType BufReadCmd set nohlsearch
autocmd fileType FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
