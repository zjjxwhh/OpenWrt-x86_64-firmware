#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate
sed -i '11s/lan/wan/g' package/base-files/files/etc/board.d/99-default_network
sed -i '12s/wan/lan/g' package/base-files/files/etc/board.d/99-default_network
# sed -i "159a set network.$1.gateway='192.168.9.1'" package/base-files/files/bin/config_generate
# sed -i "159a set network.$1.dns='127.0.0.1 223.5.5.5 8.8.8.8'" package/base-files/files/bin/config_generate

# Fix build error caused by CGO
sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/' feeds/cdnspeedtest/cdnspeedtest/Makefile
sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/' feeds/packages/net/mosdns/Makefile

# Fix uugamebooster build error
sed -i "s/openwrt-\$(UU_ARCH)\/\$(PKG_VERSION)\/uu.tar.gz?/openwrt-\$(UU_ARCH)\/\$(PKG_VERSION)\//g" feeds/packages/net/uugamebooster/Makefile
sed -i "s/\$(PKG_NAME)-\$(UU_ARCH)-\$(PKG_VERSION).tar.gz/uu.tar.gz/g" feeds/packages/net/uugamebooster/Makefile

rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
wget -O feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg https://raw.githubusercontent.com/zjjxwhh/OpenWrt-x86_64-firmware/main/assets/black-network-switch-with-cables.jpg

rm -rf feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config