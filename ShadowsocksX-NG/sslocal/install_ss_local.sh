#!/bin/bash

#  install_ss_local.sh
#  ShadowsocksX-NG
#
#  Created by 邱宇舟 on 16/6/6.
#  Copyright © 2016年 qiuyuzhou. All rights reserved.


cd "$(dirname "${BASH_SOURCE[0]}")"

NGDir="$HOME/Library/Application Support/ShadowsocksX-NG"
TargetDir="$NGDir/sslocal-1.11.2"
LatestTargetDir="$NGDir/sslocal-latest"

echo ngdir: ${NGDir}

mkdir -p "$TargetDir"
cp -f sslocal "$TargetDir"
rm -f "$LatestTargetDir"
ln -s "$TargetDir" "$LatestTargetDir"

echo done
