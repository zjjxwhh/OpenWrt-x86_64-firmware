#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Create cdnspeedtest directory
mkdir -p package/lean/cdnspeedtest

# Add cdnspeedtest
curl -fL "https://raw.githubusercontent.com/immortalwrt/packages/master/net/cdnspeedtest/Makefile" | sed 's,../../lang,$(TOPDIR)/feeds/packages/lang,' > "package/lean/cdnspeedtest/Makefile"

# Create passwall directory
mkdir -p package/lean/passwall

# Add luci-app-passwall
wget -O package/openwrt-passwall.zip https://codeload.github.com/xiaorouji/openwrt-passwall/zip/refs/heads/main
unzip -d package/openwrt-passwall package/openwrt-passwall.zip
cp -r package/openwrt-passwall/openwrt-passwall-main/luci-app-passwall package/lean/passwall/luci-app-passwall
rm -rf package/openwrt-passwall package/openwrt-passwall.zip

# Add luci-app-passwall2
wget -O package/openwrt-passwall2.zip https://codeload.github.com/xiaorouji/openwrt-passwall2/zip/refs/heads/main
unzip -d package/openwrt-passwall2 package/openwrt-passwall2.zip
cp -r package/openwrt-passwall2/openwrt-passwall2-main/luci-app-passwall2 package/lean/passwall/luci-app-passwall2
rm -rf package/openwrt-passwall2 package/openwrt-passwall2.zip

# Add openwrt-passwall-packages
wget -O package/openwrt-passwall-packages.zip https://codeload.github.com/xiaorouji/openwrt-passwall-packages/zip/refs/heads/main
unzip -d package/openwrt-passwall-packages package/openwrt-passwall-packages.zip
cp -r package/openwrt-passwall-packages/openwrt-passwall-packages-main/* package/lean/passwall
rm -rf package/openwrt-passwall-packages package/openwrt-passwall-packages.zip

# Add luci-app-openclash
wget -O package/openclash.zip https://codeload.github.com/vernesong/OpenClash/zip/refs/heads/master
unzip -d package/openclash package/openclash.zip
cp -r package/openclash/OpenClash-master/luci-app-openclash package/lean/luci-app-openclash
rm -rf package/openclash package/openclash.zip