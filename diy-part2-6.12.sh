#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.9.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate

# Update luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
wget -O feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg https://raw.githubusercontent.com/zjjxwhh/OpenWrt-x86_64-firmware/main/assets/black-network-switch-with-cables.jpg

# Update luci-app-argon-config
rm -rf feeds/luci/applications/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config

# Update luci-app-adguardhome
git clone https://github.com/sirpdboy/luci-app-adguardhome.git package/lean/luci-app-adguardhome