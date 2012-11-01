" Tabs and Spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set autoindent

" Misc
set nocompatible
set number
set hidden " hide on unsaved changes
set autoread
set ignorecase
set smartcase
set incsearch
set nohlsearch
set encoding=utf8
set showcmd
set complete=i,t

" Store swap files in one place
set directory=~/.local/tmp

" no blinking!
set guicursor=a:blinkon0
set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error

if has("gui_macvim")
  set guifont=Menlo:h13
end

syntax on

" Bundles
filetype off " Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'pangloss/vim-javascript'

Bundle 'Command-T'
let g:CommandTMatchWindowAtTop=1
map <F3> :CommandTFlush<CR>\|:CommandT<CR>

Bundle 'L9'
Bundle 'FuzzyFinder'
map <F2> :FufBuffer<CR>

" Snippets
Bundle 'gmarik/snipmate.vim'
au! BufWritePost *.snippets call ReloadAllSnippets()

" NERD tree
Bundle 'scrooloose/nerdtree'
let g:NERDTreeHijackNetrw=1
let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=40
let g:NERDTreeMapHelp='??'
map <F4> :NERDTreeToggle<CR>

Bundle 'grep.vim'
Bundle 'ervandew/supertab'

" Git integration
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

Bundle 'tlib'
Bundle 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

filetype on
filetype plugin on
filetype indent on

" Projects
command! Settings :e project.vim
au BufWritePost project.vim :so %

" Shortcut commands
command! Vimrc :e ~/.vim/vimrc
command! Gvimrc :e ~/.vim/gvimrc
command! Vimfiles :!project ~/.vim/bundle
command! Snippets :e ~/.vim/snippets
command! Colors :e ~/.vim/colors/my.vim
command! Script :e ~/dev/scripts
command! Profile :e ~/.profile
imap ;l <Esc>

"Some Sublime bindings
imap <C-Enter> <Esc>o
imap <C-S-Enter> <Esc>O

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
