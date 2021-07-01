#!/bin/sh

#  stop_ss_local.sh
#  ShadowsocksX-NG
#
#  Created by 邱宇舟 on 16/6/6.
#  Copyright © 2016年 qiuyuzhou. All rights reserved.

launchctl stop com.exgphe.shadowsocksX-NG.local
launchctl unload "$HOME/Library/LaunchAgents/com.exgphe.shadowsocksX-NG.local.plist"
