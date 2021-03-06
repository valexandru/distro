# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5" #EAPI, read docs for this. natural we use 5, but there must be a src_prepare() at least with something in it

inherit eutils #Object-oriented packaging, inherit classes with functions that will follow

DESCRIPTION="Example 2nd"
HOMEPAGE="http://rogentos.ro"
SRC_URI="http://valexandru.biz/random.tar.gz"

LICENSE="GPL-2"
SLOT="0" #How many times do you want this package to exist/to be installed, to coexist in different versions
KEYWORDS="~* ~amd64 ~x86" #Every architecture you like
IUSE="" #Configure flags, also known as ./configure --features --enable/disable features to be used

RDEPEND="" #runtime deps
DEPEND="" #build deps
COMMON_DEPEND="" #Your deps, if you want to handle your own dep-control

S="${WORKDIR}" #optional. declare S from the working sandbox folder

# The next step must be used in anyway possible for the EAPI=5 to be valid
# Naturally, you can start by using insinto functions 
src_prepare() { #unpacked files in the sandbox can be easily modified before all instalation process in this way
	insinto /usr/share/icons/scalable/apps/ || die # Make the function die if it fails
}

src_install() { #while compilation
	insinto "/home/" || die # Make the function die if it fails
	doins "${S}"/random/loggentoo-ro || die # Copy the file into the directory where function insinto was used
	elog "Congrats! Now you have an exclusive copy of a log of #gentoo-ro in /home/ ! Unfortunately/Fortunately is in Romainian."
}
