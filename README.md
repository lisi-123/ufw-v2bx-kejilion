## 一键安装ufw+v2bx+科技lion脚本

您可以通过以下命令一键下载并执行安装脚本：

```bash
apt-get install wget -y && wget -O setup.sh https://raw.githubusercontent.com/lisi-123/ufw-v2bx-kejilion/main/setup.sh && chmod +x setup.sh && ./setup.sh
```

此命令将执行以下操作：

1.安装ufw防火墙并放行端口（不会用ufw防火墙请咨询chatgpt）

tcp：80，44443，33332

udp：35500:35600，50000

2.安装xiao佬的v2bx

3.安装科技lion的脚本

4.修改vps时区为中国上海

5.设置v2bx每天凌晨4点自动重启


<br>

## 一键解锁warp

```bash
wget -O setup1.sh https://raw.githubusercontent.com/lisi-123/ufw-v2bx-kejilion/main/setup1.sh && chmod +x setup1.sh && ./setup1.sh
```

此命令将执行以下操作：

自动安装warp，并设置本地socks5代理（默认使用40000端口，请勿占用）

如果warp安装失败，请前往 https://gitlab.com/fscarmen/warp 手动安装

自动替换v2bx的路由文件

仅供自用，本人习惯使用xiao版v2bx，内核选择sing-box，其他版本大概无效

xiao佬的v2bx: https://github.com/wyx2685/V2bX

小白遇到各种 command not found 请先执行
```bash
apt-get update; apt-get install wget -y; apt install sudo -y; sudo apt install curl -y
```
