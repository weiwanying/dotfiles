OpenWrt
====

[OpenWrt Router](http://seanxp.com/2017/OpenWrt-Router/)

* 国外线路：dnsmasq(:53) –(dnsmasq-china-list)–(DNS forwardings)–> ChinaDNS(:5353) –(CHNRoute File & Upstream Servers)–> ss-tunnel / dns-forwarder (:5300) –( Port Forward / DNS-Forwarder)–> ss server –>8.8.8.8:53
* 国内线路：dnsmasq(:53) –(dnsmasq-china-list)–(DNS forwardings)–> ChinaDNS(:5353) –(CHNRoute File & Upstream Servers)–> 114.114.114.114:53
