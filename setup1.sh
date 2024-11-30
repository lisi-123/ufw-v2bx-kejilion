#!/bin/bash

# 先下载并执行 menu.sh 脚本
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh <<< $'2\n13\n40000\n1\n'

# 替换配置文件
wget -N https://github.com/<用户>/<仓库>/raw/main/path/to/file -P /path/to/target/directory
