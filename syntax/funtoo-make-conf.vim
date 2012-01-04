" Vim syntax file
" Language:	Funtoo make.conf Files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo make.conf files. Needs vim 6.3 or later.
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
  finish
endif

runtime syntax/funtoo-common.vim

syn cluster FuntooMakeConfEC add=FuntooMakeConfEUse,FuntooMakeConfEAK,FuntooMakeConfEAL,FuntooMakeConfEAP,FuntooMakeConfECFLAGS,FuntooMakeConfELDFLAGS,FuntooMakeConfEMAKEOPTS,FuntooMakeConfECHOST,FuntooMakeConfEFEATURES,FuntooMakeConfEMISC,FuntooMakeConfEMISCK,FuntooMakeConfEMISCKE,FuntooMakeConfEMISCN
syn region  FuntooMakeConfE start=/^/ end=/$/ contains=@FuntooMakeConfEC,FuntooMakeConfComment

" MISC {{{
syn match   FuntooMakeConfEMISC /[a-zA-Z0-9\-\_]\+\([^a-zA-Z0-9\-\_]\)\@=/ contained nextgroup=FuntooMakeConfEMISCE skipwhite

syn match   FuntooMakeConfEMISCE /=/ contained nextgroup=FuntooMakeConfEMISCV,FuntooMakeConfEMISCVNoQ skipwhite
syn region  FuntooMakeConfEMISCV contained start=/"/ end=/"/ contains=FuntooMakeConfEMISCIX
syn region  FuntooMakeConfEMISCVNoQ contained start=/[^ "]/ end=/\s\|$/ contains=FuntooMakeConfEMISCIX
syn match   FuntooMakeConfEMISCIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained

" naughty
syn match   FuntooMakeConfEMISCN /LDFLAGS\|ASFLAGS\|ARCH\|ELIBC\|KERNEL\|USERLAND/ contained nextgroup=FuntooMakeConfEMISCE skipwhite
" known but not handled specially
syn match   FuntooMakeConfEMISCK /GENTOO_MIRRORS\|SYNC\|PORTAGE_NICENESS\|PORTDIR_OVERLAY\|PORTAGE_GPG_DIR\|PORTAGE_GPG_KEY\|CONFIG_PROTECT_MASK\|CONFIG_PROTECT\|FETCHCOMMAND\|RESUMECOMMAND\|AUTOCLEAN\|BUILD_PREFIX\|CBUILD\|CLEAN_DELAY\|COLLISION_IGNORE\|DISTDIR\|DOC_SYMLINKS_DIR\|EMERGE_DEFAULT_OPTS\|HTTP_PROXY\|FTP_PROXY\|NOCOLOR\|PKGDIR\|PORT_LOGDIR\|PORTAGE_BINHOST\|PORTAGE_BINHOST\|PORTAGE_BINPKG_TAR_OPTS\|PORTAGE_COMPRESS\|PORTAGE_COMPRESS_FLAGS\|PORTAGE_ELOG_CLASSES\|PORTAGE_ELOG_COMMAND\|PORTAGE_ELOG_MAILFROM\|PORTAGE_ELOG_MAILURI\|PORTAGE_ELOG_SYSTEM\|PORTAGE_FETCH_CHECKSUM_TRY_MIRRORS\|PORTAGE_FETCH_RESUME_MIN_SIZE\|PORTAGE_RSYNC_EXTRA_OPTS\|PORTAGE_RSYNC_OPTS\|PORTAGE_RSYNC_INITIAL_TIMEOUT\|PORTAGE_RSYNC_RETRIES\|PORTAGE_TMPDIR\|PORTAGE_WORKDIR_MODE\|PORTDIR\|ROOT\|RSYNC_EXCLUDEFROM\|RSYNC_RETRIES\|RSYNC_TIMEOUT\|RPMDIR\|USE_ORDER\|LINGUAS\|VIDEO_CARDS\|INPUT_DEVICES\|CAMERAS\|EXTRA_ECONF\|ALSA_CARDS\|ALSA_PCM_PLUGINS\|PORTAGE_TMPFS\|INSTALL_MASK\|QA_STRICT_EXECSTACK\|QA_STRICT_WX_LOAD\|QA_STRICT_TEXTRELS\|APACHE2_MODULES\|APACHE2_MPMS\|CROSSCOMPILE_OPTS\|DVB_CARDS\|FOO2ZJS_DEVICES\|LCD_DEVICES\|LIRC_DEVICES\|MISDN_CARDS/ contained nextgroup=FuntooMakeConfEMISCE skipwhite
" common eclass stuff
syn match FuntooMakeConfEMISCKE /EBEEP_IGNORE\|EPAUSE_IGNORE\|CHECKREQS_ACTION\|BREAKME\|ECHANGELOG_USER\|CCACHE_SIZE\|CCACHE_DIR\|DISTCC_DIR/ contained nextgroup=FuntooMakeConfEMISCE skipwhite

hi def link FuntooMakeConfEMISC       Keyword
hi def link FuntooMakeConfEMISCK      Identifier
hi def link FuntooMakeConfEMISCN      Error
hi def link FuntooMakeConfEMISCKE     Special
hi def link FuntooMakeConfEMISCV      String
hi def link FuntooMakeConfEMISCVNoQ   Constant
hi def link FuntooMakeConfEMISCIB     Error
hi def link FuntooMakeConfEMISCIX     Preproc
" }}}

" USE {{{
syn keyword FuntooMakeConfEUse USE contained nextgroup=FuntooMakeConfEUseE skipwhite
syn match   FuntooMakeConfEUseE /=/ contained nextgroup=FuntooMakeConfEUseV skipwhite
syn cluster FuntooMakeConfEUseIC add=FuntooMakeConfEUseID,FuntooMakeConfEUseIE,FuntooMakeConfEUseIG,FuntooMakeConfEUseIB,FuntooMakeConfEUseIX
syn region  FuntooMakeConfEUseV contained start=/"/ end=/"/ contains=@FuntooMakeConfEUseIC
syn match   FuntooMakeConfEUseIE /[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEUseID /-[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEUseIG /-\?@[a-zA-Z0-9\-\_]\+\|-\*/ contained
syn match   FuntooMakeConfEUseIB /+@\?[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEUseIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained

hi def link FuntooMakeConfEUse       Identifier
hi def link FuntooMakeConfEUseV      String
hi def link FuntooMakeConfEUseID     Keyword
hi def link FuntooMakeConfEUseIE     Special
hi def link FuntooMakeConfEUseIG     Preproc
hi def link FuntooMakeConfEUseIB     Error
hi def link FuntooMakeConfEUseIX     Preproc
" }}}

" ACCEPT_KEYWORDS {{{
syn match   FuntooMakeConfEAK /ACCEPT_KEYWORDS/ contained nextgroup=FuntooMakeConfEAKE skipwhite
syn match   FuntooMakeConfEAKE /=/ contained nextgroup=FuntooMakeConfEAKV skipwhite
syn cluster FuntooMakeConfEAKIC add=FuntooMakeConfEAKIS,FuntooMakeConfEAKIU,FuntooMakeConfEAKIB,FuntooMakeConfEAKIX
syn region  FuntooMakeConfEAKV contained start=/"/ end=/"/ contains=@FuntooMakeConfEAKIC
" do not change keyword order!
syn match   FuntooMakeConfEAKIS /alpha\|amd64\|arm\|hppa\|ia64\|m68k\|mips\|ppc-macos\|ppc64\|ppc\|s390\|sh\|sparc\|x86-obsd\|x86-fbsd\|x86/ contained
syn match   FuntooMakeConfEAKIU /\~\(alpha\|amd64\|arm\|hppa\|ia64\|m68k\|mips\|ppc-macos\|ppc64\|ppc\|s390\|sh\|sparc\|x86-obsd\|x86-fbsd\|x86\)/ contained
syn match   FuntooMakeConfEAKIB /-[a-zA-Z0-9\-\_]\+/ contained
syn match   FuntooMakeConfEAKIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained

hi def link FuntooMakeConfEAK       Identifier
hi def link FuntooMakeConfEAKV      String
hi def link FuntooMakeConfEAKIS     Keyword
hi def link FuntooMakeConfEAKIU     Special
hi def link FuntooMakeConfEAKIB     Error
hi def link FuntooMakeConfEAKIX     Preproc
" }}}

" ACCEPT_LICENSE {{{
syn match   FuntooMakeConfEAL /ACCEPT_LICENSE/ contained nextgroup=FuntooMakeConfEALE skipwhite
syn match   FuntooMakeConfEALE /=/ contained nextgroup=FuntooMakeConfEALV skipwhite
syn cluster FuntooMakeConfEALIC add=FuntooMakeConfEALIP,FuntooMakeConfEALIS,FuntooMakeConfEALIN,FuntooMakeConfEALIX
syn region  FuntooMakeConfEALV contained start=/"/ end=/"/ contains=@FuntooMakeConfEALIC
syn match   FuntooMakeConfEALIP /\*\|[a-zA-Z0-9\-_.+]\+/ contained
syn match   FuntooMakeConfEALIS /@[a-zA-Z0-9\-_.+]\+/ contained
syn match   FuntooMakeConfEALIN /-\*\|-@\?[a-zA-Z0-9\-_.+]\+/ contained
syn match   FuntooMakeConfEALIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained

hi def link FuntooMakeConfEAL       Identifier
hi def link FuntooMakeConfEALV      String
hi def link FuntooMakeConfEALIP     Keyword
hi def link FuntooMakeConfEALIS     Special
hi def link FuntooMakeConfEALIN     Error
hi def link FuntooMakeConfEALIX     Preproc
" }}}

" ACCEPT_PROPERTIES {{{
syn match   FuntooMakeConfEAP /ACCEPT_PROPERTIES/ contained nextgroup=FuntooMakeConfEAPE skipwhite
syn match   FuntooMakeConfEAPE /=/ contained nextgroup=FuntooMakeConfEAPV skipwhite
syn cluster FuntooMakeConfEAPIC add=FuntooMakeConfEAPIP,FuntooMakeConfEAPIN,FuntooMakeConfEAPIX
syn region  FuntooMakeConfEAPV contained start=/"/ end=/"/ contains=@FuntooMakeConfEAPIC
syn match   FuntooMakeConfEAPIP /\*\|[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEAPIN /-\*\|-[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEAPIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained

hi def link FuntooMakeConfEAP       Identifier
hi def link FuntooMakeConfEAPV      String
hi def link FuntooMakeConfEAPIP     Keyword
hi def link FuntooMakeConfEAPIN     Error
hi def link FuntooMakeConfEAPIX     Preproc
" }}}

" C*FLAGS {{{
syn match   FuntooMakeConfECFLAGS /C\(XX\)\?FLAGS/ contained nextgroup=FuntooMakeConfECFLAGSE skipwhite
syn match   FuntooMakeConfECFLAGSE /=/ contained nextgroup=FuntooMakeConfECFLAGSV,FuntooMakeConfECFLAGSVNoQ skipwhite
syn cluster FuntooMakeConfECFLAGSIC add=FuntooMakeConfECFLAGSIB1,FuntooMakeConfECFLAGSIB2,FuntooMakeConfECFLAGSIB3,FuntooMakeConfECFLAGSIX
syn region  FuntooMakeConfECFLAGSV contained start=/"/ end=/"/ contains=@FuntooMakeConfECFLAGSIC
syn match   FuntooMakeConfECFLAGSIB1 /-ffast-math\|-freduce-all-givs\|-mfpmath=sse,387\|-DNDEBUG\|-s\([a-zA-Z0-9\-\_]\)\@!\|-Wno\S\+\|x86.\?64\|-mvis/ contained
syn match   FuntooMakeConfECFLAGSIB2 /-[0o][123s]/ contained
syn match   FuntooMakeConfECFLAGSIB3 /\%(-Os\|-fPIC\|-fpic\|-DPIC\)\%(\(=\%(k8\|opteron\|athlon64\|athlon-fx\).*\)\@<=\|\(.*=\%(k8\|opteron\|athlon64\|athlon-fx\)\)\@=\)/
syn match   FuntooMakeConfECFLAGSIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained
syn region  FuntooMakeConfECFLAGSVNoQ contained start=/[^ "]/ end=/\s\|$/ contains=FuntooMakeConfECFLAGSIX

hi def link FuntooMakeConfECFLAGS       Identifier
hi def link FuntooMakeConfECFLAGSV      String
hi def link FuntooMakeConfECFLAGSVNoQ   Constant
hi def link FuntooMakeConfECFLAGSIB1    Error
hi def link FuntooMakeConfECFLAGSIB2    Error
hi def link FuntooMakeConfECFLAGSIB3    Error
hi def link FuntooMakeConfECFLAGSIX     Preproc
" }}}

" LDFLAGS {{{
syn match   FuntooMakeConfELDFLAGS /LDFLAGS/ contained nextgroup=FuntooMakeConfELDFLAGSE skipwhite
syn match   FuntooMakeConfELDFLAGSE /=/ contained nextgroup=FuntooMakeConfELDFLAGSV,FuntooMakeConfELDFLAGSVNoQ skipwhite
syn cluster FuntooMakeConfELDFLAGSIC add=FuntooMakeConfELDFLAGSIB1,FuntooMakeConfELDFLAGSIB2,FuntooMakeConfELDFLAGSIB3,FuntooMakeConfELDFLAGSIX
syn region  FuntooMakeConfELDFLAGSV contained start=/"/ end=/"/ contains=@FuntooMakeConfELDFLAGSIC
syn match   FuntooMakeConfELDFLAGSIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained
syn region  FuntooMakeConfELDFLAGSVNoQ contained start=/[^ "]/ end=/\s\|$/ contains=FuntooMakeConfELDFLAGSIX

hi def link FuntooMakeConfELDFLAGS       Identifier
hi def link FuntooMakeConfELDFLAGSV      String
hi def link FuntooMakeConfELDFLAGSVNoQ   Constant
hi def link FuntooMakeConfELDFLAGSIX     Preproc
" }}}

" MAKEOPTS {{{
syn match   FuntooMakeConfEMAKEOPTS /MAKEOPTS/ contained nextgroup=FuntooMakeConfEMAKEOPTSE skipwhite
syn match   FuntooMakeConfEMAKEOPTSE /=/ contained nextgroup=FuntooMakeConfEMAKEOPTSV skipwhite
syn cluster FuntooMakeConfEMAKEOPTSIC add=FuntooMakeConfEMAKEOPTSIB
syn region  FuntooMakeConfEMAKEOPTSV contained start=/"/ end=/"/ contains=@FuntooMakeConfEMAKEOPTSIC
syn match   FuntooMakeConfEMAKEOPTSIB /-j \+[0-9]\+/ contained

hi def link FuntooMakeConfEMAKEOPTS       Identifier
hi def link FuntooMakeConfEMAKEOPTSV      String
hi def link FuntooMakeConfEMAKEOPTSIB     Error
" }}}

" CHOST {{{
syn match   FuntooMakeConfECHOST /CHOST/ contained nextgroup=FuntooMakeConfECHOSTE skipwhite
syn match   FuntooMakeConfECHOSTE /=/ contained nextgroup=FuntooMakeConfECHOSTV,FuntooMakeConfECHOSTVNoQ skipwhite
syn cluster FuntooMakeConfECHOSTIC add=FuntooMakeConfECHOSTIB
syn region  FuntooMakeConfECHOSTV contained start=/"/ end=/"/ contains=@FuntooMakeConfECHOSTIC
syn match   FuntooMakeConfECHOSTIB /sparc\(-unknown-linux-gnu\)\@![^ ]\+/ contained
syn region  FuntooMakeConfECHOSTVNoQ contained start=/[^ "]/ end=/\s\|$/ contains=FuntooMakeConfECFLAGSIX

hi def link FuntooMakeConfECHOST       Identifier
hi def link FuntooMakeConfECHOSTV      String
hi def link FuntooMakeConfECHOSTVNoQ   String
hi def link FuntooMakeConfECHOSTIB     Error
" }}}

" FEATURES {{{
syn keyword FuntooMakeConfEFEATURES FEATURES contained nextgroup=FuntooMakeConfEFEATURESE skipwhite
syn match   FuntooMakeConfEFEATURESE /=/ contained nextgroup=FuntooMakeConfEFEATURESV skipwhite
syn cluster FuntooMakeConfEFEATURESIC add=FuntooMakeConfEFEATURESID,FuntooMakeConfEFEATURESIE,FuntooMakeConfEFEATURESIB,FuntooMakeConfEFEATURESIX
syn region  FuntooMakeConfEFEATURESV contained start=/"/ end=/"/ contains=@FuntooMakeConfEFEATURESIC
syn match   FuntooMakeConfEFEATURESIE /[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEFEATURESID /-[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEFEATURESIB /+[a-zA-Z0-9\-_]\+/ contained
syn match   FuntooMakeConfEFEATURESIX /\\.\|\$\({[^}]\+}\|[a-zA-Z0-9\-\_]\+\)/ contained

hi def link FuntooMakeConfEFEATURES       Identifier
hi def link FuntooMakeConfEFEATURESV      String
hi def link FuntooMakeConfEFEATURESID     Keyword
hi def link FuntooMakeConfEFEATURESIE     Special
hi def link FuntooMakeConfEFEATURESIG     Preproc
hi def link FuntooMakeConfEFEATURESIB     Error
hi def link FuntooMakeConfEFEATURESIX     Preproc
" }}}

syn region  FuntooMakeConfComment start=/#/ end=/$/ contains=FuntooBug

hi def link FuntooMakeConfComment    Comment


let b:current_syntax = "funtoo-make-conf"

" vim: set foldmethod=marker : "
