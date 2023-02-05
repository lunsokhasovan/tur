TERMUX_PKG_HOMEPAGE=https://github.com/eeeXun/GTT
TERMUX_PKG_DESCRIPTION="Google Translate TUI (Originally). Now support ArgosTranslate, GoogleTranslate."
# XXX: Upstream doesn't provide a license, so use the READMD
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="README.md"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="2"
TERMUX_PKG_SRCURL=https://github.com/eeeXun/GTT/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=5576e8d971e8e876cfe9d490c91448b651416648ccc0a7a1c667e30c3a5bad00
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_golang

	go mod init || :
	go mod tidy
}

termux_step_make() {
	go build -ldflags="-s -w -X main.version=$TERMUX_PKG_VERSION"
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}"/bin "$TERMUX_PKG_SRCDIR"/gtt
}
