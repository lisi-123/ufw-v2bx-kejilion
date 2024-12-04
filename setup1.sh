#!/bin/bash

# 先下载并执行 menu.sh 脚本
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh <<< $'2\n13\n40000\n1\n'

# 替换配置文件 sing_origin.json
wget -N https://raw.githubusercontent.com/lisi-123/ufw-v2bx-kejilion/main/sing_origin.json -P /etc/V2bX/

echo "已自动配置warp解锁，重启v2bx生效"
