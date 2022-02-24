set nocompatible " VImproved

" Desabilitar backups:
set nobackup
set noswapfile
set nowritebackup

colorscheme slate
" Clipboard do sistema:
set clipboard=unnamed

" Fonte e janela:
set guifont=consolas:h12
set encoding=utf-8
set lines=36 columns=142

filetype off  " required by vundle

filetype plugin indent on    " required
syntax on


"=====[ Abbreviations ]===========================
ab meuemail Jose Ari Junior <joseari.jr@gmail.com>
ab mail11 Jose Ari Junior <joseari.jr@gmail.com>
ab sheb #!/bin/bash

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

set formatoptions-=cro

set wrapmargin=2                            "Wrap 2 characters from the edge of the window
set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks
inoremap # X<C-H>#|                         "And no magic outdent for comments
nnoremap <silent> >> :call ShiftLine()<CR>| "And no shift magic on comments

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction


"====[ I also hate modelines, but i do not remember why ;) ]===================
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

"=====[ Put Your custom configurations in that file ]======================= 
silent! execute 'source ' .  expand("$HOME/vimrc_custom")

behave mswin
