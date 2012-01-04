" Vim plugin
" Purpose:	create content for new init.d scripts
" Author:	Aaron Walker <ka0ttic@gentoo.org>
" Copyright:	Copyright (c) 2005 Aaron Walker
" License:	You may redistribute this under the same terms as Vim itself
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
"

if &compatible || v:version < 603 || exists("g:loaded_newinitd")
    finish
endif

let g:loaded_newinitd=1

runtime! plugin/funtoo-common.vim

fun! <SID>MakeNewInitd()
    " {{{ default functions
    put ='depend() {'
    put =''
    put ='}'
    put =''
    put ='start() {'
    put =''
    put ='}'
    put =''
    put ='stop() {'
    put =''
    put ='}'
    put =''
    put ='restart() {'
    put =''
    put ='}'
    " }}}

    call FuntooHeader()
    0 put ='#!/sbin/runscript'
endfun

com! -nargs=0 NewInitd call <SID>MakeNewInitd() | set filetype=funtoo-init-d

augroup NewInitd
    au!
    autocmd BufNewFile {/*/files/*.{rc*,init*},/etc/init.d/*}
	\ call <SID>MakeNewInitd() | set filetype=funtoo-init-d
augroup END

" vim: set et foldmethod=marker : "
