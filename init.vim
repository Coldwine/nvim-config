set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

function! s:SourceConfigFiles(directory)
  let l:directory_splat = '~/.config/nvim/' . a:directory . '/*.vim'
  for l:config_file in split(glob(l:directory_splat), '\n')
    if filereadable(l:config_file)
      execute 'source' l:config_file
    endif
  endfor
endfunction

function! s:LoadPlugins()
  if dein#load_state(expand('~/.config/nvim/dein'))
    call dein#begin(expand('~/.config/nvim/dein'))
      source ~/.config/nvim/plugins.vim
    call dein#end()
    call dein#save_state()
  endif
endfunction

let g:mapleader = "\<space>"
let g:maplocalleader = "\\"

call s:LoadPlugins()
call s:SourceConfigFiles('rcbase')
call s:SourceConfigFiles('functions')
call s:SourceConfigFiles('rcplugins')

runtime macros/matchit.vim
set termguicolors
let g:neodark#solid_vertsplit = 1
colorscheme neodark
