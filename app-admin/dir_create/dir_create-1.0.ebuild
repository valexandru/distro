# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
 
EAPI="5"  

inherit eutils  

DESCRIPTION="Having fun with GOlang. Just another program made by Noxis"
HOMEPAGE="https://github.com/BlackNoxis/gofun/"
SRC_URI="https://github.com/valexandru/gofun/blob/master/${PN}.tar.gz"

LICENSE="GPL-2"
SLOT="0"  
KEYWORDS="~* ~amd64 ~x86"  
IUSE=""  

RDEPEND=""  
DEPEND="dev-lang/go" #build deps
COMMON_DEPEND=""  

S="${WORKDIR}"

src_compile(){
    go build ${WORKDIR}/${PN}.go
}

src_install() {
    insinto /usr/bin
    doins ${PN} 
    fperms 755 /usr/bin/${PN}
    elog "to run the installed program, just type dir_create in a normal shell"    
}


