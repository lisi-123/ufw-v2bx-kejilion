#!/bin/bash

# 检查是否以 root 权限运行
if [ "$EUID" -ne 0 ]; then
  echo "请以 root 用户运行此脚本。"
  exit 1
fi

# gai.conf 文件路径
GAI_CONF="/etc/gai.conf"

# 备份 gai.conf 文件
if [ ! -f "$GAI_CONF.bak" ]; then
  echo "正在备份 $GAI_CONF 为 $GAI_CONF.bak"
  cp "$GAI_CONF" "$GAI_CONF.bak"
else
  echo "备份文件已存在：$GAI_CONF.bak"
fi

# 更新 gai.conf 文件
if grep -q "^#precedence ::ffff:0:0/96" "$GAI_CONF"; then
  echo "启用 precedence ::ffff:0:0/96 设置..."
  sed -i 's/^#precedence ::ffff:0:0\/96/precedence ::ffff:0:0\/96/' "$GAI_CONF"
else
  if ! grep -q "^precedence ::ffff:0:0/96" "$GAI_CONF"; then
    echo "添加 precedence ::ffff:0:0/96 设置..."
    echo "precedence ::ffff:0:0/96  100" >> "$GAI_CONF"
  else
    echo "设置已存在，无需修改。"
  fi
fi

# 重启网络服务
echo "正在重启网络服务..."
systemctl restart networking

# 提示完成
echo "设置完成，网络服务已重启。"
