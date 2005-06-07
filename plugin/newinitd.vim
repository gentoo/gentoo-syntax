" Vim plugin
" Purpose:	create content for new init.d scripts
" Author:	Aaron Walker <ka0ttic@gentoo.org>
" Copyright:	Copyright (c) 2005 Aaron Walker
" License:	You may redistribute this under the same terms as Vim itself

if &compatible || v:version < 603
    finish
endif

runtime! plugin/gentoo-common.vim

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

    call GentooHeader()
    0 put ='#!/sbin/runscript'
endfun

com! -nargs=0 NewInitd call <SID>MakeNewInitd() | set filetype=gentoo-init-d

augroup NewInitd
    au!
    autocmd BufNewFile {/*/files/*.{rc*,init*},/etc/init.d/*}
	\ call <SID>MakeNewInitd() | set filetype=gentoo-init-d
augroup END

" vim: set et foldmethod=marker : "
