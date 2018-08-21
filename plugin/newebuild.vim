" Vim plugin
" Purpose:      Intelligently create content for new ebuild files
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:    Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:      You may redistribute this under the same terms as Vim itself

if &compatible || v:version < 603 || exists("g:loaded_newebuild")
    finish
endif

let g:loaded_newebuild=1

runtime! plugin/gentoo-common.vim

fun! <SID>MakeNewEbuild()
    let l:pastebackup = &paste
    set nopaste

    " {{{ variables
    let l:arch = GentooGetArch()
    let l:filename = expand("%:p")
    let l:category = substitute(l:filename,
                \ "^.*/\\([^/]\\+\\)/[^/]\\+/[^/]\\+\\.ebuild", "\\1", "g")

    " use empty keywords for live ebuilds
    if l:filename =~# "-9999\\+.ebuild\$"
        let l:keywords = ""
    else
        let l:keywords = "~" . l:arch
        if l:arch ==# "amd64"
            let l:keywords = l:keywords . " ~x86"
        endif
    endif

    " }}}

    call GentooHeader()

    if expand("%:e") =~# "eclass\$"
        " {{{ eclass special setup
        let l:eclass=expand("%:t")
        put ='# @ECLASS: ' . l:eclass
        put ='# @MAINTAINER:'
        put ='# ' . GentooGetUser()
        put ='# @AUTHOR:'
        put ='# ' . GentooGetUser()
        put ='# @BLURB: '
        put ='# @DESCRIPTION:'
        put =''
        " }}}

        " {{{ go to the first thing to edit
        0
        /^# @BLURB:/
        normal $
        nohls
        " }}}
    else
        put ='EAPI=7'
        put =''
        if l:category ==# "app-vim"
            " {{{ app-vim special setup
            put ='#VIM_PLUGIN_VIM_VERSION=\"7.0\"'
            put ='inherit vim-plugin'
            put =''
            put ='DESCRIPTION=\"vim plugin: \"'
            put ='HOMEPAGE=\"http://www.vim.org/scripts/script.php?script_id=\"'
            put ='LICENSE=\"\"'
            put ='KEYWORDS=\"' . l:keywords . '\"'
            put ='IUSE=\"\"'
            put =''
            put ='VIM_PLUGIN_HELPFILES=\"\"'
            put ='VIM_PLUGIN_HELPTEXT=\"\"'
            put ='VIM_PLUGIN_HELPURI=\"\"'
            put ='VIM_PLUGIN_MESSAGES=\"\"'
            put =''
            " }}}
        elseif l:category ==# "www-apache" && expand("%:t") =~# "^mod_"
            " {{{ www-apache default setup (for module pkgs)
            put ='inherit apache-module'
            put =''
            put ='DESCRIPTION=\"\"'
            put ='HOMEPAGE=\"\"'
            put ='LICENSE=\"\"'
            put =''
            put ='KEYWORDS=\"' . l:keywords . '\"'
            put ='IUSE=\"\"'
            put ='SLOT=\"0\"'
            put =''
            put ='# See apache-module.eclass for more information.'
            put ='APACHE2_MOD_CONF=\"XX_${PN}\"'
            put ='APACHE2_MOD_DEFINE=\"\"'
            put =''
            put ='need_apache2'
            " }}}
        elseif l:category ==# "dev-java"
            " {{{ dev-java generation-2 default java-pkg-simple ebuild
            put ='JAVA_PKG_IUSE=\"doc source\"'
            put =''
            put ='inherit java-pkg-2 java-pkg-simple'
            put =''
            put ='DESCRIPTION=\"\"'
            put ='HOMEPAGE=\"\"'
            put ='SRC_URI=\"${P}.zip\"'
            put =''
            put ='LICENSE=\"\"'
            put ='SLOT=\"0\"'
            put ='KEYWORDS=\"' . l:keywords . '\"'
            put =''
            put ='IUSE=\"\"'
            put =''
            put ='CP_DEPEND=\"\"'
            put =''
            put ='RDEPEND=\">=virtual/jre-1.8'
            put ='  ${CP_DEPEND}\"'
            put ='DEPEND=\">=virtual/jdk-1.8'
            put ='  ${CP_DEPEND}\"'
        elseif l:category ==# "dev-perl" || l:category ==# "perl-core"
            " {{{ perl modules default setup
            put ='DIST_AUTHOR=\"\"'
            put ='inherit perl-module'
            put =''
            put ='DESCRIPTION=\"\"'
            put =''
            put ='#LICENSE=\"\|\| ( Artistic GPL-1+ )\"'
            put ='SLOT=\"0\"'
            put ='KEYWORDS=\"' . l:keywords . '\"'
            put ='IUSE=\"\"'
            put =''
            put ='RDEPEND=\"\"'
            put ='DEPEND=\"${RDEPEND}\"'
            " }}}
        else
            " {{{ standard default setup
            " {{{ extra inherits for some categories
            if l:category ==# "dev-python"
                put ='PYTHON_COMPAT=( ' . GentooGetPythonTargets() . ' )'
                put ='inherit distutils-r1'
                put =''
            endif
            " }}}

            put ='DESCRIPTION=\"\"'
            put ='HOMEPAGE=\"\"'
            put ='SRC_URI=\"\"'
            put =''
            put ='LICENSE=\"\"'
            put ='SLOT=\"0\"'
            put ='KEYWORDS=\"' . l:keywords . '\"'
            put ='IUSE=\"\"'
            put =''

            " {{{ extra deps for some categories
            put ='DEPEND=\"\"'
            put ='RDEPEND=\"${DEPEND}\"'
            put ='BDEPEND=\"\"'
            " }}}
        endif

        " {{{ go to the first thing to edit
        0
        /^\(DIST_AUTHOR\|DESCRIPTION\)=/
        exec "normal 2f\""
        nohls
        " }}}
    endif

    if pastebackup == 0
        set nopaste
    endif
endfun

com! -nargs=0 NewEbuild call <SID>MakeNewEbuild()

if !exists("g:ebuild_create_on_empty")
    " Enable autogeneration of ebuilds by default
    let g:ebuild_create_on_empty = 1
endif

" check to see if v:progname is vimdiff to disable new ebuild creation
if v:progname =~ "vimdiff"
    let g:ebuild_create_on_empty = 0
endif

augroup NewEbuild
    au!
    autocmd BufNewFile *.e{build,class}
                \ if g:ebuild_create_on_empty |
                \    call <SID>MakeNewEbuild() |
                \ endif
augroup END

" vim: set et foldmethod=marker : "
