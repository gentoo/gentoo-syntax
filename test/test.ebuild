# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# EBUILD SYNTAX TEST FILE
# NOT A VALID EBUILD

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

inherit

# Phases
pkg_pretend
pkg_nofetch
pkg_setup
src_unpack
src_prepare
src_configure
src_compile
src_test
src_install
pkg_preinst pkg_postinst
pkg_prerm pkg_postrm
pkg_config

# Default Phases
default
default_src_unpack
default_src_prepare
default_src_configure
default_src_compile
default_src_test

# Build Functions
unpack
econf
emake

# Error Functions
die
assert
nonfatal

# Install Functions
into
insinto
exeinto
docinto
insopts
diropts
exeopts
libopts
dobin
doconfd
dodir
dodoc
einstalldocs
doenvd
doexe
doheader
dohtml
doinfo
doinitd
doins
# dolib functions use a regex match
# These should match
dolib
dolib.a
dolib.so
# The first part should match
dolib a
dolib.a a
dolib.so a
# None of these should match
doliba
dolib.aa
dolib.soa
dolib.a.so
dolib.a.so a
# The second should match
a dolib
a dolib.a
a dolib.so
a dolib a
a dolib.a a
a dolib.so a
# None of these should match
a doliba
a dolib.aa
a dolib.soa
a dolib.a.so
a dolib.a.so a
adolib
adolib.a
adolib.so
adolib a
adolib.a a
adolib.so a
adoliba
adolib.aa
adolib.soa
adolib.a.so
adolib.a.so a
doman
domo
dosbin
dosym
fowners
fperms
keepdir
newbin
newconfd
newdoc
newenvd
newexe
newheader
newinitd
newins
# newlib functions use a regex match
# These should match
newlib.a
newlib.so
# The first part should match
newlib.a a
newlib.so a
# None of these should match
newliba
newlib.aa
newlib.soa
newlib.a.so
newlib.a.so a
# The second should match
a newlib.a
a newlib.so
a newlib.a a
a newlib.so a
# None of these should match
a newliba
a newlib.aa
a newlib.soa
a newlib.a.so
a newlib.a.so a
anewlib
anewlib.a
anewlib.so
anewlib a
anewlib.a a
anewlib.so a
anewliba
anewlib.aa
anewlib.soa
anewlib.a.so
anewlib.a.so a
newman
newsbin
docompress
dostrip
einstall
dosed
dohard

# Message Functions
einfo
einfon
elog
ewarn
eerror
ebegin
eend
eqawarn

# Query Functions
use
useq
usev
usex
use_enable
use_with
has
hasq
hasv
best_version
has_version

# Sandbox Functions
addread
addwrite
adddeny
addpredict
