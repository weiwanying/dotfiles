#!/bin/bash
#################################################################
#   Copyright (C) 2016 Sean Guo. All rights reserved.
#
#   > File Name:        < iptables-clear.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2016/06/28 >
#   > Description:      firewall - clear all iptables and open all port
#################################################################

# 1. 清除原有的iptables-filter规则, 重新配置; 以下命令需要ROOT权限
#   '-F', deleting all the rules one by one.
iptables -t filter -F
#   '-X', Delete the optional user-defined chain specified.
iptables -t filter -X
#   '-Z', Zero the packet and byte counters in all chains, or only the given chain, or only the given rule in a chain.
iptables -t filter -Z

# 2. 设置默认策略(Public Policy)
#   '-P', Set the policy for the chain to the given target.
# 将INPUT的默认策略设为DROP为安全的策略, 不过需要更多的规则设定允许进入的数据包;
#iptables -t filter -P INPUT   DROP
iptables -t filter -P INPUT   ACCEPT
iptables -t filter -P OUTPUT  ACCEPT
iptables -t filter -P FORWARD ACCEPT
