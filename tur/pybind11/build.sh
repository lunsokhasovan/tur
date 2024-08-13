TERMUX_PKG_HOMEPAGE=https://pybind11.readthedocs.org
TERMUX_PKG_DESCRIPTION="A lightweight header-only library that exposes C++ types in Python and vice versa"
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION="2.13.3"
TERMUX_PKG_SRCURL=https://github.com/pybind/pybind11/archive/v${TERMUX_PKG_VERSION}/pybind11-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=6e7a84ec241544f2f5e30c7a82c09c81f0541dd14e9d9ef61051e07105f9c445
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_BUILD_DEPENDS="boost, eigen"
TERMUX_PKG_PYTHON_COMMON_DEPS="setuptools"
TERMUX_CMAKE_BUILD="Unix Makefiles"
