TERMUX_PKG_HOMEPAGE=https://github.com/blueskyusf-code/spt-lcode
TERMUX_PKG_DESCRIPTION="KomiKomizu Team development tools for OpenSP environment"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Programador Supremo <Blueskyusf@gmail.com>"
TERMUX_PKG_VERSION=1.0.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_DEPENDS="proot-distro, curl, coreutils, shred"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
    install -Dm755 execute.sh $TERMUX_PREFIX/bin/spt-exec
}
