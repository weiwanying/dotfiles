#!/bin/bash
#################################################################
#   Copyright (C) 2015 Sean Guo. All rights reserved.
#														  
#	> File Name:        < aria2c.sh >
#	> Author:           < Sean Guo >		
#	> Mail:             < iseanxp+code@gmail.com >		
#	> Created Time:     < 2015/12/08 >
#	> Last Changed: 
#	> Description:		以RPC方式启动aria2
#						Aria2 WebUI: http://ziahamza.github.io/webui-aria2/
#           JSON-RPC Path: 
#                 默认: http://localhost:6800/jsonrpc
#                 --rpc-secret:   http://token:xxxxxx@host:port/jsonrpc
#################################################################

aria2c --conf-path="$HOME/.aria2/aria2.conf" -D
