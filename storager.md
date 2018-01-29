封闭系统的存储和开放系统的存储，封闭系统主要指大型机，AS400等服务器，开放系统指基于包括Windows、UNIX、Linux等操作系统的服务器；开放系统的存储分为：内置存储和外挂存储；开放系统的外挂存储根据连接的方式分为：直连式存储（Direct-Attached Storage，简称DAS）和网络化存储（Fabric-Attached Storage，简称FAS）；开放系统的网络化存储根据传输协议又分为：网络接入存储（Network-Attached Storage，简称NAS）和存储区域网络（Storage Area Network，简称SAN）。

1. DAS: 直接连接存储 (DAS:Direct Attached Storage)
2. NAS: 网络连接存储 (NAS:Network Attached Storage)
3. SAN: 存储区域网络(SAN：Storage Area Network)，目前的SAN存储有2种：一是基于光纤通道的FC SAN；二是基于以太网的IP SAN(也就常说的iSCSI)。 FC SAN通过光纤交换机连接到主机(HBA卡) iSCSI作为共享于以太网络上的存储则更类似于NAS。

区别:
```
DAS ：可作为本机的外挂硬盘，不过现在单块磁盘的空间已经很大，如果几个T的空间，直接在主机里插硬盘就可以实现了，不需要外挂。 
NAS ：由于它的文件系统特性，加上以太网网线传输，更像是我的电脑-网上邻居-共享磁盘，访问方式也是类似：\NAS01BACKUPdatabase_name.bak。更多的是作为文件共享、备份、归档所用，比如数据库的历史备份/异地备份文件。 
SAN ：FC SAN使用光纤传输，是一个高速的共享存储，数据库的任何东西都可以放在上面，还有就是在做集群时(failover clustering) 作为仲裁盘，合适做虚拟化项目和性能要求高的数据库存储；iSCSI的传输速率要低于FC SAN，目前在我们的环境中还没有直接使用iSCSI做数据库存储，通常是用在类似NAS的地方。
   总结：DAS存储一般应用在中小企业，与计算机采用直连方式，性能与成本最低；NAS存储则通过IP以太网添加到计算机上，性能与成本中等；SAN存储则使用FC光纤接口，性能与成本较高。SAN与NAS的主要区别体现在操作系统在什么位置
```

server:
```shell
yum -y install scsi-target-utils
systemctl status tgtd
systemctl start tgtd

tgtadm --lld iscsi --op new --mode target --tid 1 -T iqn.2012-01.cn.nayun:test-01
tgtadm --lld iscsi --op new --mode logicalunit --tid 1 --lun 1 -b /dev/sdb 
tgtadm --lld iscsi --op bind --mode target --tid 1 -I ALL  --网内所有Initiator均可访问
tgtadm --lld iscsi --op bind --mode target --tid 1 -I 192.168.1.210      --允许某个IP地址访问
tgtadm --lld iscsi --op bind --mode target --tid 1 -I 192.168.1.0/24     --允许某个网络访问 
tgtadm --lld iscsi --op new --mode account --user scott --password tiger
tgtadm --lld iscsi --op bind --mode account --tid 1 --user scott
                      
tgtadm --lld iscsi --op show --mode target
tgtadm --lld iscsi --op show --mode account
```
/etc/tgt/targets.conf
```
<target iqn.2012-01.cn.nayun:test-01>
                backing-store /dev/sdb
                incominguser scott tiger
                initiator-address 192.168.1.0/24
                initiator-address 192.168.1.210
</target>
```
client:
```shell
yum -y install iscsi-initiator-utils-devel
systemctl status iscsi
systemctl status iscsid

iscsiadm -m discovery -t sendtargets -p 192.168.**.**
iscsiadm -m node --login
vi /etc/iscsi/initiatorname.iscsi
```
