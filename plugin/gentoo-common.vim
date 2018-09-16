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

fun! GentooHeader(...)
    " The shebang arg is optional
    let l:year = strftime("%Y")
    let l:copyright = '# Copyright ' . l:year . ' Gentoo Authors'

    " Only one arg allowed (shebang only)
    if a:0 == 1
        0 put =a:1 " Insert shebang
        put =l:copyright
    else
        0 put =l:copyright
    endif
    put ='# Distributed under the terms of the GNU General Public License v2'
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
            let l:a = "amd64"
        endif
        let g:gentooarch = l:a
        return g:gentooarch
    endif
endfun

fun! GentooGetPythonTargets()
    if exists("g:gentoopythontargets") && g:gentoopythontargets != ""
        return g:gentoopythontargets
    else
        let l:py2 = system("eselect python show --python2")
        let l:py2 = substitute(l:py2, "\n", "", "g")
        let l:py3 = system("eselect python show --python3")
        let l:py3 = substitute(l:py3, "\n", "", "g")

        if l:py2 == ""
            let l:py2 = "python2.7"
        endif
        if l:py3 == ""
            let l:py3 = "python3.4"
        endif

        let l:pythons = substitute(l:py2 . " " . l:py3, "[.]", "_", "g")

        let g:gentoopythontargets = l:pythons
        return g:gentoopythontargets
    endif
endfun

" vim: set et foldmethod=marker : "
