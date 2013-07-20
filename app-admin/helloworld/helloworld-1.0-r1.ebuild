# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5" #EAPI, read docs for this. natural we use 5, but there must be a src_prepare() at least with something in it

inherit eutils #Object-oriented packaging, inherit classes with functions that will follow

DESCRIPTION="The most ultimate useless ebuild that was ever written brought to ya by a n00b ebuilder"
HOMEPAGE="http://valexandru.biz"
SRC_URI="http://valexandru.biz/"${PN}".tar.gz"

LICENSE="GPL-2"
SLOT="0" #How many times do you want this package to exist/to be installed, to coexist in different versions
KEYWORDS="~* ~amd64 ~x86" #Every architecture you like
IUSE="" #Configure flags, also known as ./configure --features --enable/disable features to be used

RDEPEND="" #runtime deps
DEPEND="" #build deps
COMMON_DEPEND="" #Your deps, if you want to handle your own dep-control

S="${WORKDIR}"/${PN}/ # PN means the name of the ebuild. http://devmanual.gentoo.org/ebuild-writing/variables/

# The next step must be used in anyway possible for the EAPI=5 to be valid
# Naturally, you can start by using insinto functions 
src_prepare() { #unpacked files in the sandbox can be easily modified before all instalation process in this way
        epatch "${WORKDIR}/${P}-update.tar.gz"
        epatch "${FILESDIR}/hellosource.patch"
	insinto "${S}"/${PN}/ || die "Failed to cd into directory"
        emake || die "Failed to emake"
}

src_install() {
        insinto /home/
        doins "${S}"/"${PN}" || die "Failed to copy compiled file" # Again, S means workdir and PN is helloworld
        elog "you're either stupid or forced if you install this"
}

