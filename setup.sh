#!/bin/bash

# 更新软件包列表
apt-get update

# 安装必需的软件包
apt install sudo -y
sudo apt install curl -y
sudo apt-get install ufw -y
sudo apt install nano -y

# 配置防火墙规则
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 853/tcp
sudo ufw allow 853/udp
sudo ufw allow 44443/tcp
sudo ufw allow 33332/tcp
sudo ufw allow 35000:36000/udp
sudo ufw allow 50000/udp

# 设置iptables规则
sudo iptables -t nat -A PREROUTING -p udp --dport 35000:36000 -j REDIRECT --to-port 50000

# 启用UFW防火墙
sudo ufw --force enable

# 执行其他安装指令
wget -N https://raw.githubusercontent.com/lisi-123/V2bX-script/master/install.sh && bash install.sh v0.1.5
curl -sS -O https://raw.githubusercontent.com/kejilion/sh/main/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh

# 修改为上海时区
sudo timedatectl set-timezone Asia/Shanghai

# 添加定时任务（凌晨4点自动重启v2bx）
CRON_JOB='0 4 * * * echo "6" | /usr/bin/v2bx'
(crontab -l 2>/dev/null; echo "$CRON_JOB") | sort -u | crontab -

# 输出完成信息
echo "Setup complete!"
