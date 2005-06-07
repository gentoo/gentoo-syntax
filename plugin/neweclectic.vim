" Vim plugin
" Purpose:      Intelligently create content for new ebuild files
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>,
"               Elfyn McBratney <beu@gentoo.org>
" Copyright:    Copyright (c) 2004-2005 Ciaran McCreesh
"               Copyright (c) 2005 Elfyn McBratney
" Licence:      You may redistribute this under the same terms as Vim itself

if &compatible || v:version < 603
    finish
endif

" nicked from gentoo-common.vim
fun! EclecticModuleHeader()
    let l:year = strftime("%Y")
    0 put ='# Copyright 1999-' . l:year . ' Gentoo Foundation'
    put ='# Distributed under the terms of the GNU General Public License v2'
    put ='# $Header: $'
    $
endfun

fun! <SID>MakeNewEclecticModule()
    let l:pastebackup = &paste
    set nopaste

    call EclecticModuleHeader()

    " {{{ boiler-plate eclectic module
    put ='DESCRIPTION=\"\"'
    put ='MAINTAINER=\"you@gentoo.org\"'
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

com! -nargs=0 MakeNewEclecticModule call <SID>MakeNewEclecticModule()

augroup MakeNewEclecticModule
    au!
    autocmd BufNewFile *.eclectic
        \ call <SID>MakeNewEclecticModule()
augroup end

" vim: sw=4 ts=4 et fdm=marker
