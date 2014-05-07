# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

BASE_PN=${PN%%-bin}
if [ ${PV} = 9999 ]; then
	EGIT_REPO_URI="git://sigrok.org/${PN}"
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="http://sigrok.org/download/binary/${BASE_PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Prebuilt firmware for sigrok to use Cypress FX2 based devices such as Salae Logic"
HOMEPAGE="http://sigrok.org/"

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

RDEPEND="!sci-electronics/sigrok-firmware-fx2lafw"
DEPEND="${RDEPEND}"

src_install () {
	insinto /usr/share/sigrok-firmware
	doins *.fw
}
