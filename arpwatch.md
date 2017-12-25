yum install arpwatch  <br>

systemctl status arpwatch <br>

arpwatch -i eth0 <br>

-d 启动排错模式。 <br>
-f<记录文件> 设置存储ARP记录的文件，预设为/var/arpwatch/arp.dat。 <br>
-i<接口> 指定监听ARP的接口，预设的接口为eth0。 <br>
-r<记录文件> 从指定的文件中读取ARP记录，而不是从网络上监听。 <br>
-n 指定附加的本地网络 <br>
-u 指定用户和用户组 <br>
-e 发送邮件给指定用户，非默认的root用户 <br>
-s 指定用户名作为返回地址，而不是默认的用户root <br>

日志: <br>
tail -f /var/log/messages <br>

配置文件: <br>
/etc/sysconfig/arpwatch <br>
