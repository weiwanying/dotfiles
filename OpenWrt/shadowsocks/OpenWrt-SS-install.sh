#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < OpenWrt-SS-install.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/21 >
#   > Description:      OpenWrt WR702N (ar71xx) - shadowsocks-libev
#################################################################
opkg update
opkg install wget

# shadowsocks-libev: https://github.com/shadowsocks/openwrt-shadowsocks/releases
wget --no-check-certificate https://dl.bintray.com/aa65535/opkg/shadowsocks-libev/3.0.2/OpenWrt/ar71xx/shadowsocks-libev_3.0.2-1_ar71xx.ipk
wget --no-check-certificate https://dl.bintray.com/aa65535/opkg/shadowsocks-libev/3.0.2/OpenWrt/ar71xx/libev_4.22-1_ar71xx.ipk
wget --no-check-certificate https://dl.bintray.com/aa65535/opkg/shadowsocks-libev/3.0.2/OpenWrt/ar71xx/libmbedtls_2.4.0-2_ar71xx.ipk
wget --no-check-certificate https://dl.bintray.com/aa65535/opkg/shadowsocks-libev/3.0.2/OpenWrt/ar71xx/libpcre_8.39-1_ar71xx.ipk
wget --no-check-certificate https://dl.bintray.com/aa65535/opkg/shadowsocks-libev/3.0.2/OpenWrt/ar71xx/libsodium_1.0.11-2_ar71xx.ipk
# luci-app-shadowsocks: https://github.com/shadowsocks/luci-app-shadowsocks/releases
wget --no-check-certificate https://github.com/shadowsocks/luci-app-shadowsocks/releases/download/v1.6.0/luci-app-shadowsocks_1.6.0-1_all.ipk
# openwrt-chinadns: https://github.com/aa65535/openwrt-chinadns/releases
wget --no-check-certificate https://github.com/aa65535/openwrt-chinadns/releases/download/v1.3.2-4/ChinaDNS_1.3.2-4_ar71xx.ipk
# luci-app-chinadns: https://github.com/aa65535/openwrt-dist-luci/releases
wget --no-check-certificate https://github.com/aa65535/openwrt-dist-luci/releases/download/v1.6.0/luci-app-chinadns_1.6.0-1_all.ipk
# dns-forwarder: https://github.com/aa65535/openwrt-dns-forwarder/releases
wget --no-check-certificate https://github.com/aa65535/openwrt-dns-forwarder/releases/download/v1.1.1/dns-forwarder_1.1.1-1_ar71xx.ipk
# luci-app-dns-forwarder
wget --no-check-certificate https://github.com/aa65535/openwrt-dist-luci/releases/download/v1.6.0/luci-app-dns-forwarder_1.6.0-1_all.ipk

opkg install libev*.ipk libmbedtls*.ipk libpcre*.ipk libsodium*.ipk
opkg install shadowsocks-libev*.ipk luci-app-shadowsocks*.ipk
opkg install ChinaDNS*.ipk luci-app-chinadns*.ipk
opkg install dns-forwarder*.ipk luci-app-dns-forwarder*.ipk
