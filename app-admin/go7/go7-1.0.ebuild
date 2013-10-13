# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"  

inherit eutils  

DESCRIPTION="Having fun with GOlang. Just another program made by Noxis"
HOMEPAGE="https://github.com/BlackNoxis/gofun/"
SRC_URI="https://github.com/BlackNoxis/gofun/blob/master/go7/dir_create.go"

LICENSE="GPL-2"
SLOT="0"  
KEYWORDS="~* ~amd64 ~x86"  
IUSE=""  

RDEPEND=""  
DEPEND="dev-lang/go" #build deps
COMMON_DEPEND=""  

S=/var/tmp/portage/app-admin/go7-1.0/work/

src_prepare() { #unpacked files in the sandbox can be easily modified before all instalation process in this way
	insinto /var/tmp/portage/app-admin/go7-1.0/work/ || die
	wget http://valexandru.biz/dir_create.go
}

src_install() {
    go build /var/tmp/portage/app-admin/go7-1.0/work/dir_create.go
    sudo cp /var/tmp/portage/app-admin/go7-1.0/work/dir_create /usr/bin/
    elog "to run the installed program, just type dir_create in a normal shell"    
}


