# CentOS 的网络配置

#### CentOS 的网络配置其实很简单, ip, mask, gateway, dns 等等都可以在一个地方搞定(最佳实践):

    /etc/sysconfig/network-scripts/ifcfg-XXX


参考[这篇文档](http://www.centos.org/docs/2/rhl-rg-en-7.2/ch-networkscripts.html)

一般我们配置 `ifcfg-eth0`, 如下:

    DEVICE="eth0"
    IPADDR=192.168.0.2
    NETMASK=255.255.255.0
    GATEWAY=192.168.0.1
    DNS1=114.114.114.114
    DNS2=8.8.8.8

BROADCAST, NETWORK 可以不配, 系统自己可以算出来.


不重启系统即可应用新的配置:

    service network restart


别的地方不需要配置了, 通过这个配置文件, 系统可以生成相关的文件如 /etc/resolv.conf


#### 还可配置多个虚拟网卡, 如加一个 ifcfg-eth0_255_1:

    DEVICE="eth0:0"
    IPADDR=192.168.255.1
    NETMASK=255.255.255.0

eth0:NUMBER 随意选个数字.

多个网卡配好后, 如果 /proc/sys/net/ipv4/ip_forward == 1, 就可以做路由了:
    
    echo 1 >/proc/sys/net/ipv4/ip_forward

    或:
    # EDIT /etc/sysctl.conf
    net.ipv4.ip_forward = 1
    # THEN
    # $ sysctl -p