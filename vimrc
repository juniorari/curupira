set nocompatible " VImproved
filetype off  " required by vundle

"=====[ Vundle setup ] ==============================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp'
" Plugin 'Valloric/YouCompleteMe'

set rtp+=~/.vim/bundle/vim-snipmate,~/.vim/bundle/vim-snipmate/after
set runtimepath^=~/.vim/bundle/ctrlp.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on


"=====[ Abbreviations ]===========================
ab meuemail Jose Ari Junior <joseari.jr@gmail.com>
ab mail11 Jose Ari Junior <joseari.jr@gmail.com>
ab sheb #!/bin/bash

"=====[ Ctags ] ==================================
set tags=./tags;/,~/.vimtags,./phptags

"=====[ Comments are important ]==================
highlight Comment ctermfg=white term=bold


"====[ Set up smarter search behaviour ]=======================
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used
set hlsearch        "Highlight all matches

set number

"====[ Set background hint (if possible) ]=============

if $VIMBACKGROUND != ""
    exec 'set background=' . $VIMBACKGROUND
else
    set background=dark
endif

"=====[ Enable smartwrapping ]==================================

" No smartwrapping in any of these files...
"let g:SW_IGNORE_FILES = '.vimrc,*.vim,*.pl,*.pm,**/bin/**'

" set comments-=s1:/*,mb:*,ex:*/      "Don't recognize C comments
" set comments-=:XCOMM                "Don't recognize lmake comments
" set comments-=:%                    "Don't recognize PostScript comments
" set comments-=:#                    "Don't recognize Perl/shell comments
" set comments+=fb:*                  "Star-space is a bullet
" set comments+=fb:-                  "Dash-space is a bullets

set formatoptions-=cro

set wrapmargin=2                            "Wrap 2 characters from the edge of the window
set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks
"set cinwords = ""                           "But not for C-like keywords
inoremap # X<C-H>#|                         "And no magic outdent for comments
nnoremap <silent> >> :call ShiftLine()<CR>| "And no shift magic on comments

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction


"====[ I also hate modelines ]===================
set modelines=0


"=====[ Miscellaneous ]==========================

set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected


set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings
                                    "but prefer Unix endings

set scrolloff=2 "Scroll when 2 lines from top/bottom

set ruler "Show cursor location info on status line


"=====[ Tab handling ]======================================

set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else


" Make the completion popup look menu-ish on a Mac...
highlight  Pmenu        ctermbg=white   ctermfg=black
highlight  PmenuSel     ctermbg=blue    ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey    ctermfg=grey
highlight  PmenuThumb   ctermbg=blue    ctermfg=blue

" Setup NerdTree style for Explorer
let g:netrw_liststyle=3

"=====[ Put Your custom configurations in that file ]======================= 
silent! execute 'source ' .  expand("$HOME/.vimrc_custom")
