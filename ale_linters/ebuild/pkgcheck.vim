" Language:  Gentoo Ebuilds/Eclasses
" Author:    Anna Vyalkova <cyber+gentoo@sysrq.in>
" Copyright: Copyright (c) 2023 Anna Vyalkova
" Licence:   You may redistribute this under the same terms as Vim itself
"
" Asynchronous linter for ebuilds and eclasses powered by pkgcheck.
" Requires vim 8.0 or later.
"

call ale#Set('ebuild_pkgcheck_executable', 'pkgcheck')
call ale#Set('ebuild_pkgcheck_options', '')

function! ale_linters#ebuild#pkgcheck#Handle(buffer, lines) abort
    let l:output = ale#python#HandleTraceback(a:lines, 10)

    if !empty(l:output)
        return l:output
    endif

    let l:pkgcheck_type_to_ale_type = {
    \    'error': 'E',
    \    'info': 'I',
    \    'style': 'W',
    \    'warning': 'W',
    \}
    let l:pkgcheck_type_to_ale_sub_type = {
    \    'style': 'style',
    \}

    let l:pattern = '\v^(\d*):([a-z]+):(\w+): (.*)$'
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:lnum = str2nr(l:match[1])
        let l:type = l:match[2]
        let l:code = l:match[3]
        let l:text = l:match[4]

        if l:lnum == 0
            let l:lnum = str2nr(matchstr(l:text, '\m\<lines\? \zs\d\+\ze'))
        endif

        call add(l:output, {
        \   'lnum': l:lnum,
        \   'code': l:code,
        \   'type': get(l:pkgcheck_type_to_ale_type, l:type, 'E'),
        \   'sub_type': get(l:pkgcheck_type_to_ale_sub_type, l:type, ''),
        \   'text': l:text,
        \})
    endfor

    return l:output
endfunction

function! ale_linters#ebuild#pkgcheck#GetCommand(buffer) abort
    return '%e'
    \    . ' scan'
    \    . ale#Pad(ale#Var(a:buffer, 'ebuild_pkgcheck_options'))
    \    . ' -R FormatReporter'
    \    . ' --format "{lineno}:{level}:{name}: {desc}"'
    \    . ' %s'
endfunction

call ale#linter#Define('ebuild', {
\    'name': 'pkgcheck',
\    'executable': {buffer -> ale#Var(buffer, 'ebuild_pkgcheck_executable')},
\    'command': function('ale_linters#ebuild#pkgcheck#GetCommand'),
\    'lint_file': 1,
\    'callback': 'ale_linters#ebuild#pkgcheck#Handle',
\})
