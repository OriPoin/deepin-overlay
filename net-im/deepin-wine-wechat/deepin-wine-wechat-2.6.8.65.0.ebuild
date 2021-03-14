# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="Tencent WeChat for Linux by Deepin"
HOMEPAGE="https://www.deepin.org"

COMMON_URI="http://packages.deepin.com/deepin/pool/non-free/d"
MY_PN="deepin.com.wechat"
MY_PV=$(ver_rs 4 'deepin' )


LICENSE="Tencent"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-apps/xwininfo
	app-emulation/deepin-wine
	app-emulation/deepin-wine-helper"

S=${WORKDIR}

src_install() {
	mv ${S}/usr/local/share ${S}/usr/share
	rm -r ${S}/usr/local
	
	insinto /
	doins -r opt usr
	
	fperms 755 /opt/deepinwine/apps/Deepin-WeChat/run.sh
}
