" Vim filetype detection file
" Language:    Eclectic Things
" Author:      Elfyn McBratney <beu@gentoo.org>
" Copyright:   Copyright (c) 2005 Elfyn McBratney
" Licence:     You may redistribute this under the same terms as Vim itself
"
" This sets up syntax highlighting for Eclectic modules.
"

if &compatible || v:version < 603
    finish
endif

" eclectic modules
au BufNewFile,BufRead *.eclectic
    \     set filetype=eclectic

" vim: sw=4 ts=4 et fdm=marker
