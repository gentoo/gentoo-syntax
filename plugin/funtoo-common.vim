" Vim plugin
" Purpose:      Common functionality for Funtoo-syntax plugins
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:    Copyright (c) 2005 Ciaran McCreesh
" Licence:      You may redistribute this under the same terms as Vim itself
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
"

if &compatible || v:version < 603 || exists("g:loaded_funtoo_common")
    finish
endif

let g:loaded_funtoo_common=1

fun! FuntooGetUser()
    let l:result = expand("\$ECHANGELOG_USER")
    if l:result ==# "\$ECHANGELOG_USER"
        let l:result = expand("\$USER")
    endif
    if l:result ==# "\$USER"
        let l:result = ""
    endif
    return l:result
endfun

fun! FuntooHeader()
    let l:year = strftime("%Y")
    0 put ='# Copyright 2008-' . l:year . ' Funtoo Technologies'
    put ='# Distributed under the terms of the GNU General Public License v2'
    put ='# $Header: $'
    $
endfun

fun! FuntooGetArch()
    if exists("g:funtooarch") && g:funtooarch != ""
        return g:funtooarch
    else
        let l:a = system("portageq envvar ACCEPT_KEYWORDS 2>/dev/null")
        let l:a = substitute(l:a, "[\\n~]", " ", "g")
        let l:a = substitute(l:a, "^\\s\\+", "", "")
        let l:a = substitute(l:a, "\\s.*", "", "")
        if l:a == ""
            let l:a = "x86"
        endif
        let g:funtooarch = l:a
        return g:funtooarch
    endif
endfun

" vim: set et foldmethod=marker : "
