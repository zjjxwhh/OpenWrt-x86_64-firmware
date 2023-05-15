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
sed -i '13s/^.*$/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
# sed -i "159a set network.$1.gateway='192.168.9.1'" package/base-files/files/bin/config_generate
# sed -i "159a set network.$1.dns='127.0.0.1 223.5.5.5 8.8.8.8'" package/base-files/files/bin/config_generate

rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
