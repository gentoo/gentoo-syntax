" Vim plugin
" Purpose:      Common functionality for gentoo-syntax plugins
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:    Copyright (c) 2005 Ciaran McCreesh
" Licence:      You may redistribute this under the same terms as Vim itself

if &compatible || v:version < 603 || exists("g:loaded_gentoo_common")
    finish
endif

let g:loaded_gentoo_common=1

fun! GentooGetUser()
    let l:result = expand("\$ECHANGELOG_USER")
    if l:result ==# "\$ECHANGELOG_USER"
        let l:result = expand("\$USER")
    endif
    if l:result ==# "\$USER"
        let l:result = ""
    endif
    return l:result
endfun

fun! GentooHeader()
    let l:year = strftime("%Y")
    0 put ='# Copyright 1999-' . l:year . ' Gentoo Foundation'
    put ='# Distributed under the terms of the GNU General Public License v2'
    put ='# $Header: $'
    $
endfun

fun! GentooGetArch()
    if exists("g:gentooarch") && g:gentooarch != ""
        return g:gentooarch
    else
        let l:a = system("portageq envvar ACCEPT_KEYWORDS 2>/dev/null")
        let l:a = substitute(l:a, "[\\n~]", " ", "g")
        let l:a = substitute(l:a, "^\\s\\+", "", "")
        let l:a = substitute(l:a, "\\s.*", "", "")
        if l:a == ""
            let l:a = "x86"
        endif
        let g:gentooarch = l:a
        return g:gentooarch
    endif
endfun

" vim: set et foldmethod=marker : "
