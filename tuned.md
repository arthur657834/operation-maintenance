红帽Linux针对这种情况，综合多年的性能优化分析经验，将若干典型的优化场景转化为优化Profile。普通用户借助tuned和ktune特性工具，可以自由切换系统到不同的Profile模式，应用优化参数模式。同时，一些高级用户可以以这些Profile作为一个工作起始点，修改或者添加一些优化功能点，构建适合自己特性的优化Profile。

另外，Profile的组织方式非常简单，以一个目录的形式进行组织。如果需要进行迁移，只要将目录转移到一个新服务器目录，就可以实现优化策略迁移。


| Profile名称        | 应用场景           |
| ------------------- |:-------------:|
| default | 默认的节能（power-saving）配置。对系统影响最小的power-saving配置，只启动了CPU和磁盘的tuned机制；
| desktop-powersave | 针对桌面系统设计的节能Profile，对SATA适配器、CPU、网络和磁盘插件应用ALPM策略
| server-powersave | 针对服务器设计的节能Profile，对SATA适配器、禁用CD-ROM轮询、启动CPU和磁盘插件应用ALPM策略；
| laptop-ac-powersave | 针对运行于插入电源笔记本电脑应用，中等影响的节能策略，启用SATA的ALPM省电策略，启用WIFI省电策略，CPU、网络和磁盘插件收到节能影响；
| laptop-battery-powersave | 针对运行于插入电池笔记本电脑应用。激活应用所有的节能配置。对CPU、网络和IO方面，有延时缺点。
| throughput-performance | 禁用节能配置，启用sysctl模块设置来提升性能，改善网络和IO配置，切换到deadline switch；
| latency-performance | 禁用节能配置，启用sysctl模块设置来提升性能，主要在网络IO方面提升；


配置文件:
/usr/lib/tuned/

systemctl status tuned

tuned-adm list

设置模式
tuned-adm profile desktop-powersave
