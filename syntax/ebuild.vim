" Vim syntax file
" Language:	Gentoo Ebuilds/Eclasses
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for ebuilds and eclasses. Inherits from sh.vim and adds
" in Gentoo-specific highlights for certain keywords and functions. Requires
" vim 6.3 or later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
    finish
endif

let is_bash=1
runtime! syntax/sh.vim
unlet b:current_syntax

runtime syntax/gentoo-common.vim

" function names can contain more characters than sh.vim allows. Override
" this. See Gentoo bug 72469.
syn match bkshFunction	"^\s*\<\h[0-9a-zA-Z_\-\.]*\>\s*()"	skipwhite skipnl contains=bkshFunctionParen

" Default keywords
syn keyword EbuildCoreKeyword use has_version best_version use_with use_enable check_KV
syn keyword EbuildCoreKeyword keepdir econf die einstall einfo ewarn eerror diropts
syn keyword EbuildCoreKeyword dobin docinto dodoc doexe dohard dohtml doinfo  doins
syn keyword EbuildCoreKeyword dolib dolib.a dolib.so doman dosbin dosym emake exeinto
syn keyword EbuildCoreKeyword exeopts fowners fperms insinto insopts into libopts newbin
syn keyword EbuildCoreKeyword newexe newins newman newsbin prepall prepalldocs prepallinfo
syn keyword EbuildCoreKeyword prepallman prepallstrip has unpack dosed into
syn keyword EbuildCoreKeyword doinitd doconfd doenvd dojar domo dodir ebegin eend
syn keyword EbuildCoreKeyword newconfd newdoc newenvd newinitd newlib.a newlib.so
syn keyword EbuildCoreKeyword hasq hasv useq usev elog

" Sandbox
syn keyword EbuildCoreKeyword addread addwrite adddeny addpredict

" Recognised functions
syn keyword EbuildFunctions pkg_nofetch pkg_setup src_unpack src_compile src_test src_install
syn keyword EbuildFunctions pkg_preinst pkg_postinst pkg_prerm pkg_postrm pkg_config
syn keyword EbuildFunctions pkg_info src_prepare src_configure

" Default functions
syn keyword EbuildFunctions default
syn keyword EbuildFunctions default_pkg_nofetch default_src_unpack default_src_prepare
syn keyword EbuildFunctions default_src_configure default_src_compile default_src_test

" Inherit
syn keyword EbuildInherit inherit

" autotools
syn keyword EbuildAutoKeyword eautoreconf eaclocal _elibtoolize eautoconf eautoheader eautomake
" eutils
syn keyword EbuildEutilsKeyword gen_usr_ldscript draw_line epatch have_NPTL get_number_of_jobs egetent
syn keyword EbuildEutilsKeyword emktemp enewuser enewgroup edos2unix make_desktop_entry unpack_pdv
syn keyword EbuildEutilsKeyword unpack_makeself check_license cdrom_get_cds cdrom_load_next
syn keyword EbuildEutilsKeyword cdrom_locate_file_on_cd strip-linguas epause ebeep built_with_use
syn keyword EbuildEutilsKeyword make_session_desktop domenu doicon find_unpackable_file unpack_pdv
syn keyword EbuildEutilsKeyword set_arch_to_kernel set_arch_to_portage preserve_old_lib
syn keyword EbuildEutilsKeyword preserve_old_lib_notify built_with_use epunt_cxx dopamd newpamd
syn keyword EbuildEutilsKeyword make_wrapper

" flag-o-matic
syn keyword EbuildFlagoKeyword setup-allowed-flags filter-flags filter-lfs-flags append-lfs-flags
syn keyword EbuildFlagoKeyword append-flags replace-flags replace-cpu-flags is-flag filter-mfpmath
syn keyword EbuildFlagoKeyword strip-flags test_flag test_version_info strip-unsupported-flags get-flag
syn keyword EbuildFlagoKeyword has_hardened has_pic has_pie has_ssp_all has_ssp has_m64 has_m32
syn keyword EbuildFlagoKeyword replace-sparc64-flags append-ldflags filter-ldflags fstack-flags gcc2-flags

" gcc
syn keyword EbuildGCCKeyword gcc-getCC gcc-getCXX gcc-fullversion gcc-version gcc-major-version
syn keyword EbuildGCCKeyword gcc-minor-version gcc-micro-version gcc-libpath gcc-libstdcxx-version
syn keyword EbuildGCCKeyword gcc-libstdcxx-major-version gcc2-flags

" libtool
syn keyword EbuildLibtoolKeyword elibtoolize uclibctoolize darwintoolize

" fixheadtails
syn keyword EbuildFixHeadTailsKeyword ht_fix_file ht_fix_all

" fdo-mime
syn keyword EbuildFdoMimeKeyword fdo-mime_desktop_database_update fdo-mime_mime_database_update

" webapp
syn keyword EbuildWebappKeyword webapp_checkfileexists webapp_import_config webapp_strip_appdir
syn keyword EbuildWebappKeyword webapp_strip_d webapp_strip_cwd webapp_configfile webapp_hook_script
syn keyword EbuildWebappKeyword webapp_postinst_txt webapp_postupgrade_txt webapp_runbycgibin
syn keyword EbuildWebappKeyword webapp_serverowned webapp_server_configfile webapp_sqlscript
syn keyword EbuildWebappKeyword webapp_src_install webapp_pkg_postinst webapp_pkg_setup
syn keyword EbuildWebappKeyword webapp_getinstalltype webapp_src_preinst webapp_pkg_prerm

" versionator
syn keyword EbuildVersionatorKeyword get_all_version_components version_is_at_least
syn keyword EbuildVersionatorKeyword get_version_components get_major_version
syn keyword EbuildVersionatorKeyword get_version_component_range get_after_major_version
syn keyword EbuildVersionatorKeyword replace_version_separator replace_all_version_separators
syn keyword EbuildVersionatorKeyword delete_version_separator delete_all_version_separators

" cvs
syn keyword EbuildCVSKeyword cvs_fetch cvs_src_unpack

" bash-completion
syn keyword EbuildBashCompKeyword dobashcompletion bash-completion_pkg_postinst

" vim-plugin
syn keyword EbuildVimPluginKeyword vim-plugin_src_install vim-plugin_pkg_postinst vim-plugin_pkg_postrm
syn keyword EbuildVimPluginKeyword update_vim_afterscripts display_vim_plugin_help

" vim-doc
syn keyword EbuildVimDocKeyword update_vim_helptags

" multilib
syn keyword EbuildMultilibKeyword has_multilib_profile get_libdir get_multilibdir get_libdir_override
syn keyword EbuildMultilibKeyword get_abi_var get_abi_CFLAGS get_abi_LDFLAGS get_abi_CHOST
syn keyword EbuildMultilibKeyword get_abi_FAKE_TARGETS get_abi_CDEFINE get_abi_LIBDIR get_install_abis
syn keyword EbuildMultilibKeyword get_all_abis get_all_libdirs is_final_abi number_abis get_ml_incdir
syn keyword EbuildMultilibKeyword prep_ml_includes create_ml_includes create_ml_includes-absolute
syn keyword EbuildMultilibKeyword create_ml_includes-tidy_path create_ml_includes-listdirs
syn keyword EbuildMultilibKeyword create_ml_includes-makedestdirs create_ml_includes-allfiles
syn keyword EbuildMultilibKeyword create_ml_includes-sym_for_dir

" 64-bit
syn keyword Ebuild64bitKeyword 64-bit

" toolchain-funcs
syn keyword EbuildToolFuncsKeyword tc-getPROG tc-getAR tc-getAS tc-getCC tc-getCXX tc-getLD tc-getNM
syn keyword EbuildToolFuncsKeyword tc-getRANLIB tc-getF77 tc-getGCJ tc-getBUILD_CC tc-export ninj
syn keyword EbuildToolFuncsKeyword tc-is-cross-compiler tc-ninja_magic_to_arch tc-arch-kernel tc-arch
syn keyword EbuildToolFuncsKeyword tc-endian gcc-fullversion gcc-version gcc-major-version
syn keyword EbuildToolFuncsKeyword gcc-minor-version gcc-micro-version

" cron
syn keyword EbuildCronKeyword docrondir docron docrontab cron_pkg_postinst

" games
syn keyword EbuildGamesKeyword egamesconf egamesinstall gameswrapper dogamesbin dogamessbin dogameslib
syn keyword EbuildGamesKeyword dogameslib.a dogameslib.so newgamesbin newgamessbin gamesowners gamesperms
syn keyword EbuildGamesKeyword prepgamesdirs gamesenv games_pkg_setup games_src_compile games_pkg_postinst
syn keyword EbuildGamesKeyword games_ut_unpack games_umod_unpack games_make_wrapper

" subversion
syn keyword EbuildSVNKeyword subversion_fetch subversion_bootstrap subversion_src_unpack

" alternatives
syn keyword EbuildAltKeyword alternatives_auto_makesym alternatives_makesym alternatives_pkg_postinst
syn keyword EbuildAltKeyword alternatives_pkg_postrm

" rpm
syn keyword EbuildRPMKeyword rpm_unpack rpm_src_unpack

" python
syn keyword EbuildPythonKeyword python_pkg_setup python_convert_shebangs python_clean_installation_image
syn keyword EbuildPythonKeyword python_src_prepare python_src_configure python_src_compile python_src_test
syn keyword EbuildPythonKeyword python_src_install python_execute_function python_copy_sources
syn keyword EbuildPythonKeyword python_generate_wrapper_scripts python_set_active_version python_need_rebuild
syn keyword EbuildPythonKeyword PYTHON python_get_implementation python_get_implementational_package
syn keyword EbuildPythonKeyword python_get_includedir python_get_libdir python_get_sitedir python_get_library
syn keyword EbuildPythonKeyword python_get_version python_execute_nosetests python_execute_py.test
syn keyword EbuildPythonKeyword python_execute_trial python_enable_pyc python_disable_pyc python_mod_optimize
syn keyword EbuildPythonKeyword python_mod_cleanup

" check-kernel
syn keyword EbuildCheckKernelKeyword check_version_h get_KV_info is_2_4_kernel is_2_5_kernel is_2_6_kernel
syn keyword EbuildCheckKernelKeyword kernel_supports_modules

" perl-module
syn keyword EbuildPerlModuleKeyword perl-module_src_prep perl-module_src_compile perl-module_src_test
syn keyword EbuildPerlModuleKeyword perl-module_src_install perl-module_pkg_setup perl-module_pkg_preinst
syn keyword EbuildPerlModuleKeyword perl-module_pkg_postinst perl-module_pkg_prerm perl-module_pkg_postrm
syn keyword EbuildPerlModuleKeyword perlinfo fixlocalpod updatepod

" distutils
syn keyword EbuildDistutilsKeyword distutils_src_unpack distutils_src_prepare distutils_src_compile
syn keyword EbuildDistutilsKeyword distutils_src_test distutils_src_install distutils_pkg_postinst
syn keyword EbuildDistutilsKeyword distutils_pkg_postrm

" depend.apache
syn keyword EbuildDependApacheKeyword need_apache need_apache1 need_apache2

" apache-module
syn keyword EbuildApacheModuleKeyword apache-module_pkg_setup apache-module_src_compile
syn keyword EbuildApacheModuleKeyword apache-module_src_install apache-module_pkg_postinst acache_cd_dir
syn keyword EbuildApacheModuleKeyword apache_mod_file apache_doc_magic apache1_src_compile apache1_src_install
syn keyword EbuildApacheModuleKeyword apache1_pkg_postinst apache2_pkg_setup apache2_src_compile
syn keyword EbuildApacheModuleKeyword apache1_src_install apache2_pkg_postinst

" pam
syn keyword EbuildPamKeyword dopamd newpamd dopamsecurity newpamsecurity getpam_mod_dir
syn keyword EbuildPamKeyword dopammod newpammod pamd_mimic_system

" virtualx
syn keyword EbuildVirtualXKeyword virtualmake Xmake Xemake Xeconf

" gnome2
syn keyword EbuildGnome2Keyword gnome2_src_configure gnome2_src_compile gnome2_src_install
syn keyword EbuildGnome2Keyword gnome2_gconf_install gnome2_gconf_uninstal gnome2_omf_fix
syn keyword EbuildGnome2Keyword gnome2_scrollkeeper_update gnome2_pkg_postinst gnome2_pkg_postrm

" EXPORT_FUNCTIONS
syn match EbuildExportFunctions /EXPORT_FUNCTIONS/ skipwhite nextgroup=EbuildExportFunctionsFunc,EbuildExportFunctionsFuncE
syn match EbuildExportFunctionsFunc contained /\S\+\(\s\|$\)\@=/ skipwhite nextgroup=EbuildExportFunctionsFunc,EbuildExportFunctionsFuncE
syn match EbuildExportFunctionsFuncE contained /\S\+\(\s\|$\)\@=\(pkg_nofetch\|pkg_setup\|src_unpack\|src_prepare\|src_configure\|src_compile\|src_test\|src_install\|pkg_preinst\|pkg_postinst\|pkg_prerm\|pkg_postrm\|pkg_config\)\@<!/ skipwhite nextgroup=EbuildExportFunctionsFunc,EbuildExportFunctionsFuncE

" Eclass documentation
syn match EclassDocumentation /@\(BLURB\|CODE\|DESCRIPTION\|ECLASS-VARIABLE\|ECLASS\|EXAMPLE\|FUNCTION\|MAINTAINER\|RETURN\|USAGE\|VARIABLE\):/ contained
" use shComment (sh.vim), make it compatbile with other comment hightlights
syn match      shComment        "^\s*\zs#.*$"   contains=EclassDocumentation
syn match      shComment        "\s\zs#.*$"     contains=EclassDocumentation

" mistakes: misspelling
syn keyword EbuildError LICENCE
" non-GLEP 23
syn match   EbuildError /LICENSE="[^|]*|[^|].*"/
" read only
syn match   EbuildError /^\(P\|PN\|PV\|PR\|PVR\|PF\|A\)=/
" default values
syn match   EbuildError ~^S="\?\${\?WORKDIR}\?/\${\?P}\?"\?\s*$~
" not allowed
syn match   EbuildError /SLOT\s*=\s*\(""\|''\|$\)/
" not allowed
syn match   EbuildError /KEYWORDS\s*=\s*.*[^-]\*.*/
" evil syntax, ask Mr_Bones_
syn match   EbuildError /^[a-zA-Z0-9\-\_]\+ ()/
syn match   EbuildError /^[a-zA-Z0-9\-\_]\+(){/
" should be epause
syn keyword EbuildError esleep
" should be ${P}
syn match   EbuildErrorC /\${PN}-\${PV}/

" trailing space
if exists("g:ebuild_error_on_trailing_whitespace")
	echohl WarningMsg | echo "g:ebuild_error_on_trailing_whitespace is deprecated, bad space highlight is enabled by default." | echohl None
endif

" prepalldocs is 'strongly discouraged'; decided by the Council
syn keyword EbuildError prepalldocs

" these can be contained within strings etc...
" not to be used in an ebuild
syn match   EbuildErrorC /\$\?{\?EXTRA_ECONF}\?/
" stupid cat usage
syn match   EbuildErrorC /\(z\)\@<!cat \S\+\s\+|\s*\(sed\|[aef]\?grep\|sort\|cut\|head\|tail\|patch\)/
" Use type -P instead of `which`
syn match   EbuildErrorC /`which.*`\|$(which.*)/

" Special homepage handling
syn match EbuildHomePageError /^HOMEPAGE=.*\(\${[^}]*}\?\|\([^\\]\)\@<=\$[^{]\w*\).*$/

" no dev.g.o in SRC_URI
syn match   EbuildErrorC /http:..dev.gentoo.org[^ "]*\(SRC_URI.*\)\@<=/

" clusters
syn cluster EbuildThings contains=EbuildCoreKeyword,EbuildFunctions,EbuildInherit,EbuildEutilsKeyword
syn cluster EbuildThings add=EbuildLibtoolKeyword,EbuildFixHeadTailsKeyword,EbuildWebappKeyword
syn cluster EbuildThings add=EbuildFlagoKeyword,EbuildError,EbuildGCCKeyword,EbuildVersionatorKeyword
syn cluster EbuildThings add=EbuildLibtoolKeyword,EbuildHomePageError,EbuildErrorC,EbuildCVSKeyword
syn cluster EbuildThings add=EbuildBashCompKeyword,EbuildVimPluginKeyword,EbuildVimDocKeyword
syn cluster EbuildThings add=EbuildFdoMimeKeyword,EbuildMultilibKeyword,Ebuild64bitKeyword
syn cluster EbuildThings add=EbuildCronKeyword,EbuildGamesKeyword,EbuildToolFuncsKeyword
syn cluster EbuildThings add=EbuildSVNKeyword,EbuildAltKeyword,EbuildRPMKeyword,EbuildPythonKeyword
syn cluster EbuildThings add=EbuildCheckKernelKeyword,EbuildPerlModuleKeyword,EbuildDistutilsKeyword
syn cluster EbuildThings add=EbuildDependApacheKeyword,EbuildApacheModuleKeyword,EbuildPamKeyword
syn cluster EbuildThings add=EbuildVirtualXKeyword,EbuildGnome2Keyword,EbuildAutoKeyword

syn cluster shCommandSubList add=@EbuildThings
syn cluster shCommentGroup add=GentooBug
syn cluster shDblQuoteList add=EbuildErrorC

hi def link EbuildCoreKeyword                Keyword
hi def link EbuildFunctions                  Special
hi def link EbuildInherit                    Include

hi def link EbuildEutilsKeyword              Identifier
hi def link EbuildFlagoKeyword               Identifier
hi def link EbuildGCCKeyword                 Identifier
hi def link EbuildLibtoolKeyword             Identifier
hi def link EbuildFixHeadTailsKeyword        Identifier
hi def link EbuildFdoMimeKeyword             Identifier
hi def link EbuildWebappKeyword              Identifier
hi def link EbuildVersionatorKeyword         Identifier
hi def link EbuildCVSKeyword                 Identifier
hi def link EbuildBashCompKeyword            Identifier
hi def link EbuildVimPluginKeyword           Identifier
hi def link EbuildVimDocKeyword              Identifier
hi def link EbuildMultilibKeyword            Identifier
hi def link Ebuild64bitKeyword               Identifier
hi def link EbuildCronKeyword                Identifier
hi def link EbuildGamesKeyword		     Identifier
hi def link EbuildToolFuncsKeyword           Identifier
hi def link EbuildSVNKeyword		     Identifier
hi def link EbuildAltKeyword		     Identifier
hi def link EbuildRPMKeyword		     Identifier
hi def link EbuildPythonKeyword		     Identifier
hi def link EbuildCheckKernelKeyword	     Identifier
hi def link EbuildPerlModuleKeyword	     Identifier
hi def link EbuildDistutilsKeyword	     Identifier
hi def link EbuildDependApacheKeyword        Identifier
hi def link EbuildApacheModuleKeyword        Identifier
hi def link EbuildPamKeyword		     Identifier
hi def link EbuildVirtualXKeyword	     Identifier
hi def link EbuildGnome2Keyword  	     Identifier
hi def link EbuildAutoKeyword		     Identifier

hi def link EclassDocumentation              Identifier

hi def link EbuildHomePageError              Error
hi def link EbuildError                      Error
hi def link EbuildErrorC                     Error

hi def link EbuildExportFunctions            Constant
hi def link EbuildExportFunctionsFunc        Identifier
hi def link EbuildExportFunctionsFuncE       Error

let b:current_syntax = "ebuild"

