" Vim plugin
" Purpose:      Intelligently create content for new eselect files
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>,
"               Elfyn McBratney <beu@gentoo.org>
" Copyright:    Copyright (c) 2004-2005 Ciaran McCreesh
"               Copyright (c) 2005 Elfyn McBratney
" Licence:      You may redistribute this under the same terms as Vim itself

if &compatible || v:version < 603
    finish
endif

" nicked from gentoo-common.vim
fun! EselectModuleHeader()
    let l:year = strftime("%Y")
    0 put ='# Copyright 1999-' . l:year . ' Gentoo Foundation'
    put ='# Distributed under the terms of the GNU General Public License v2'
    put ='# $Id: $'
    $
endfun

fun! <SID>MakeNewEselectModule()
    let l:pastebackup = &paste
    let l:maintainer = substitute(GentooGetUser(), "^.*<\\(.*\\)>", "\\1", "g")
    set nopaste

    call EselectModuleHeader()

    " {{{ boiler-plate eselect module
    put ='DESCRIPTION=\"\"'
    put ='MAINTAINER=\"' . l:maintainer . '\"'
    put =''
    call setline(line("."), 'SVN_DATE=' . "'" . '$Date: $' . "'")
    put ='VERSION=$(svn_date_to_version \"${SVN_DATE}\" )'
    put =''
    put ='### foo action'
    put =''
    put ='## {{{ foo stuff'
    put ='describe_foo() {'
    put ='  echo \"Perform a foobration\"'
    put ='}'
    put =''
    put ='do_foo() {'
    put ='  :'
    put ='}'
    put ='## }}}'
    put =''
    put ='# vim: ts=4 sw=4 noet fdm=marker'
    " }}}

    norm gg=G

    " {{{ go to the first thing to edit
    0
    /^DESCRIPTION=/
    exec "normal 2f\""
    nohls
    " }}}
    if pastebackup == 0
        set nopaste
    endif
endfun

com! -nargs=0 MakeNewEselectModule call <SID>MakeNewEselectModule()

augroup MakeNewEselectModule
    au!
    autocmd BufNewFile *.eselect
        \ call <SID>MakeNewEselectModule()
augroup end

" vim: sw=4 ts=4 et fdm=marker
