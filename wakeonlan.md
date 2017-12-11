```
yum -y install http://soft.hixz.org/linux/wol-0.7.1-2.2.el5.rf.x86_64.rpm

wol p|u|m|b|a|g|s|d...
 Sets Wake-on-LAN options. Not all devices support this. The
 argument to this option is a string of characters specifying
 which options to enable.
p Wake on PHY activity
u Wake on unicast messages
m Wake on multicast messages
b Wake on broadcast messages
a Wake on ARP
g Wake on MagicPacket™
s Enable SecureOn™ password for MagicPacket™
d Disable (wake on nothing). This option clears all previous options.

/etc/sysconfig/network-scripts/ifcfg-eth0:
ETHTOOL_OPTS="-s ${DEVICE} wol g"

ethtool enp5s0 | grep -i wake-on

ethtool -s enp5s0 wol grep

wol XX:XX:XX:XX:XX:XX (-i 192.168.1.255)
ether-wake -i eth0 XX:XX:XX:XX:XX:XX

cat /sys/power/state
freeze standby mem disk

睡眠可能有两种方式：mem和standby，这两种方式都是suspend to RAM，简称STR，只是standby耗电更多一些，返回到正常工作方式时间更短一些而已。
echo “mem” > /sys/power/state

休眠：
  pm-hibernate 
  
待机：
  pm-suspend
  pm-suspend-hybrid


windows查询是否支持网络唤醒:
powercfg -a
PowerCfg -DEVICEQUERY wake_armed

```
  
