" Vim filetype detection file
" Language:    Eselect Things
" Author:      Elfyn McBratney <beu@gentoo.org>
" Copyright:   Copyright (c) 2005 Elfyn McBratney
" Licence:     You may redistribute this under the same terms as Vim itself
"
" This sets up syntax highlighting for Eselect modules.
"

if &compatible || v:version < 603
    finish
endif

" eselect modules
au BufNewFile,BufRead *.eselect
    \     set filetype=eselect

" vim: sw=4 ts=4 et fdm=marker
