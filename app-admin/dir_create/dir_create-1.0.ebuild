# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
 
EAPI="3"  

inherit eutils  

DESCRIPTION="Having fun with GOlang. Just another program made by Noxis"
HOMEPAGE="https://github.com/BlackNoxis/gofun/"
EGIT_REPO_URI="git://github.com/BlackNoxis/gofun.git"
MY_ECLASS="git-2"
inherit base eutils ${MY_ECLASS}

LICENSE="GPL-2"
SLOT="0"  
KEYWORDS="~* ~amd64 ~x86"  
IUSE=""  

RDEPEND=""  
DEPEND="dev-lang/go" #build deps
COMMON_DEPEND=""  

S="${WORKDIR}"
#EGIT_STORE_DIR="${WORKDIR}"

src_unpack()
{
	git-2_src_unpack
	base_src_unpack
}

src_compile(){
    go build ${WORKDIR}/go7/${PN}.go || die "dir_create.go was not found"
}

src_install() {
    insinto /usr/bin
    doins ${WORKDIR}/${PN} 
    fperms 755 /usr/bin/${PN}
    elog "to run the installed program, just type dir_create in a normal shell"    
}


