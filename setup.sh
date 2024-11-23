#!/bin/bash

# 更新软件包列表
apt-get update

# 安装必需的软件包
apt-get install wget -y
apt install sudo -y
sudo apt install curl -y
sudo apt-get install ufw -y
sudo apt install nano -y

# 修改UFW配置文件，禁用IPv6
sed -i 's/^IPV6=yes/IPV6=no/' /etc/default/ufw

# 配置防火墙规则
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 44443/tcp
sudo ufw allow 35500:35600/udp
sudo ufw allow 50000/udp

# 设置iptables规则
sudo iptables -t nat -A PREROUTING -p udp --dport 35500:35600 -j REDIRECT --to-port 50000

# 启用UFW防火墙
sudo ufw --force enable

# 执行其他安装指令
wget -N https://raw.githubusercontent.com/wyx2685/V2bX-script/master/install.sh && bash install.sh v0.0.18
curl -sS -O https://raw.githubusercontent.com/kejilion/sh/main/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh

# 添加定时任务
CRON_JOB='0 */3 * * * echo "6" | /usr/bin/v2bx'
(crontab -l 2>/dev/null; echo "$CRON_JOB") | sort -u | crontab -

# 输出完成信息
echo "Setup complete!"
