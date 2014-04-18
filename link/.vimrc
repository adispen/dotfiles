syntax on
set term='xterm-color'
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
let s:vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(s:vundle_readme)
   echo "Installing Vundle..\n"
   silent !mkdir -p ~/.vim/bundle
   silent !git clone git://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

set synmaxcol=800
set t_Co=256
set background=dark
let g:badwolf_darkgutter=0
let g:badwolf_css_props_highlight=1
let g:badwolf_tabline=1
let g:badwolf_html_link_underline=1
colorscheme badwolf
set number
"tab size
set ts=4

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/
call vundle#rc()
"Bundle 'Valloric/YouCompleteMe'
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
filetype plugin indent on


"indentation width
set sw=4

"c like indentation
set cindent


"autocomplete menu
set wildmenu
set wildmode=list:longest,full
set mouse=a

"compiling using F3
map <F3> : call CompileGcc()<CR>
func! CompileGcc()
  exec "w"
  exec "!gcc % -o %<"
endfunc

"compile and execute using F9
map <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!gcc % -o %<"
  exec "! ./%<"
endfunc

"autocomplete Parenthesis
"When you type an open brace, this will automatically
"insert a closing brace on the same line, after the cursor.
"If you quickly hit Enter after the open brace, (to begin
"a code block), the closing brace will be inserted on the
"line below the cursor. If you quickly press the open brace
"key again after the open brace, Vim won't insert anything extra,
" you'll just get a single open brace. Finally, if you quickly
"type an open and close brace, Vim will not do anything special.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

"mapping some more keys ::

"CTRL-X is cut
vnoremap <C-X> "+x

"CTRL-C is copy
vnoremap <C-C> "+y

"CTRL-V is paste
vnoremap <C-V> "+gP

"to paste blockwise, uses paste.vim autoload script
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>  <C-V>

" Show the status line even when there is one window
set laststatus=2
set encoding=utf-8

set t_Co=256

