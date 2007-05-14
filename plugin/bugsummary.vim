" Vim plugin
" Purpose:      Display summary information about a bugzilla bug
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:    Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:      You may redistribute this under the same terms as Vim itself
"
" The following commands are provided:
"   :BugSummary 12345
"   :BugDetails 12345
" In addition, a normal mode map of <Leader>bug (<Leader> defaults to
" backslash, see :help <Leader>) which calls :BugDetails on the bug under the
" cursor.
"
" Configuration options:
"   :let g:bugsummary_browser="firefox '%s'"

if &compatible || v:version < 603 || exists("g:loaded_bugsummary")
    finish
endif

let g:loaded_bugsummary=1

fun! <SID>strip(s)
    return substitute(a:s, "\\n", "", "g")
endfun

fun! <SID>tidy(s)
    let l:s = a:s
    let l:s = substitute(l:s, "&lt;",   "<", "g")
    let l:s = substitute(l:s, "&gt;",   ">", "g")
    let l:s = substitute(l:s, "&apos;", "\'", "g")
    let l:s = substitute(l:s, "&quot;", "\"", "g")
    let l:s = substitute(l:s, "&amp;",  "\\&", "g")
    return l:s
endfun

fun! <SID>extract(a, b)
    return <SID>tidy(matchstr(a:a, '\(<' . a:b . '>\)\@<=[^<]*\(</' . a:b . '>\)\@='))
endfun

fun! <SID>echomenu(s)
    let l:s = a:s . "|"
    let l:p = stridx(a:s, "|")
    echo " "
    echo "menu: "
    while -1 != l:p
        echohl Special
        echon "[" . strpart(l:s, 0, 1) . "]"
        echohl Keyword
        echon strpart(l:s, 1, l:p - 1)
        echon " "
        let l:s = strpart(l:s, l:p + 1)
        let l:p = stridx(l:s, "|")
    endwhile
    echohl
endfun

fun! <SID>GetBugSummary(id, detailed)
    try
        let l:c="wget -O - -o /dev/null 'http://bugs.gentoo.org/show_bug.cgi?id=" . a:id . "\&ctype=xml'"
        let l:r = system(l:c)
        let l:x_bug_id   = <SID>extract(l:r, 'bug_id')
        let l:x_bug_desc = <SID>extract(l:r, 'short_desc')
        let l:x_bug_from = <SID>extract(l:r, 'reporter')
        let l:x_bug_to   = <SID>extract(l:r, 'assigned_to')
        let l:x_bug_stat = <SID>extract(l:r, 'bug_status')
        let l:x_bug_res  = <SID>extract(l:r, 'resolution')
        if -1 == match(l:x_bug_desc, '\S')
            throw "Couldn't get summary for bug " . l:x_bug_id
        else
            echohl Keyword
            echo "Bug #" . <SID>strip(l:x_bug_id)
            echohl
            echon ': ' . <SID>strip(l:x_bug_stat) . " " . <SID>strip(l:x_bug_res)
            echo "    " . <SID>strip(l:x_bug_desc)
            echo "    " 
            echohl Preproc
            echon <SID>strip(l:x_bug_from)
            echohl
            echon " -> "
            echohl Preproc
            echon <SID>strip(l:x_bug_to)
            echohl

            if a:detailed
                call <SID>echomenu("return|browser|insert")
                let l:which=input("> ")
                if l:which == "b"
                    if ! exists("g:bugsummary_browser")
                        throw "You should set g:bugsummary_browser first (:help g:bugsummary_browser)"
                    else
                        let l:cmd=substitute(g:bugsummary_browser, "%s",
                                    \ 'http://bugs.gentoo.org/show_bug.cgi?id=' . a:id, "g")
                        call system(l:cmd)
                        if v:shell_error != 0
                            throw "Couldn't run " . l:cmd
                        endif
                    endif
                elseif l:which == "i"
                    call <SID>echomenu("number|link|details")
                    let l:which = input("> ")
                    if l:which == "l"
                        exec "normal i<http://bugs.gentoo.org/show_bug.cgi?id=" . l:x_bug_id . ">"
                    elseif l:which == "d"
                        exec "normal oBug #" . l:x_bug_id . ": " . l:x_bug_stat . " " . l:x_bug_res
                        exec "normal o" . l:x_bug_desc
                        exec "normal o" . l:x_bug_from . " -> " . l:x_bug_to
                        exec "normal o"
                    else
                        exec "normal iBug #" . l:x_bug_id
                    endif
                endif
            endif
        endif

    catch
        echo " "
        echohl Error
        echo v:exception
        echohl
        call input("--- Hit Return ---")
    endtry
endfun

fun! <SID>FindGetBugSummary(str, col)
    try
        let l:col = a:col - 2
        while l:col > 0 && (-1 != match(strpart(a:str, l:col, 1), '\d'))
            let l:col = l:col - 1
        endwhile
        let l:str = strpart(a:str, l:col)
        let l:i = match(l:str, '\d')
        if l:i == -1
            throw "Couldn't find a bug number"
        else
            let l:str = strpart(l:str, l:i)
            let l:i = match(l:str, '\D\|$')
            let l:str = strpart(l:str, 0, l:i)
            if match(l:str, '\d') != -1
                call <SID>GetBugSummary(l:str, 1)
            else
                throw "Couldn't find a bug number"
            endif
        endif
    catch
        echohl Error
        echo v:exception
        echohl
        call input("--- Hit Return ---")
    endtry
endfun

command! -nargs=1 BugSummary :call <SID>GetBugSummary(<args>, 0)
command! -nargs=1 BugDetails :call <SID>GetBugSummary(<args>, 1)
nmap <Leader>bug :call <SID>FindGetBugSummary(getline("."), col("."))<CR>

" vim: set et : "
