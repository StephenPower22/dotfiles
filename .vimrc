set ts=2
set sw=2
set number
set autoindent
set background=dark
set mouse=a

let html_number_lines = 0

"set clipboard=unnamedplus
set colorcolumn=80
au FileType python set expandtab ts=4 sw=4
au FileType javascript set expandtab ts=4 sw=4
au FileType text set ts=4 sw=4
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=syntaxcomplete#Complete



set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on
