	
yum -y install libcgroup libcgroup-tools

systemctl status cgconfig 


Linux把cgroups实现成一个文件系统，各个子系统的挂载点配置在/etc/cgconfig.conf文件中看到

lssubsys -m或者mount -t cgroup也可查看


cgcreate -g cpu:test
在 cpu 子系统下建立一个名为 test 的节点

cgset -r cfs_quota_us=50000 test <==> echo 50000 > /sys/fs/cgroup/cpu,cpuacct/test/cpu.cfs_quota_us
限制进程组 test 使用50%的CPU


cgexec -g cpu:large /usr/local/bin/matho-primes 0 9999999999 > /dev/null

进程号871，通过cgclassify把进程加入到/sys/fs/cgroup/test
cgclassify -g cpuset:/test 871

1) /proc/sys/vm/dirty_ratio 
这个参数控制文件系统的文件系统写缓冲区的大小，单位是百分比，表示系统内存的百分比，表示当写缓冲使用到系统内存多少的时候，开始向磁盘写出数据。增大之会使用更多系统内存用于磁盘写缓冲，也可以极大提高系统的写性能。但是，当你需要持续、恒定的写入场合时，应该降低其数值，：
echo '1' > /proc/sys/vm/dirty_ratio
2) /proc/sys/vm/dirty_background_ratio 
这个参数控制文件系统的pdflush进程，在何时刷新磁盘。单位是百分比，表示系统内存的百分比，意思是当写缓冲使用到系统内存多少的时候，pdflush开始向磁盘写出数据。增大之会使用更多系统内存用于磁盘写缓冲，也可以极大提高系统的写性能。但是，当你需要持续、恒定的写入场合时，应该降低其数值，：
echo '1' > /proc/sys/vm/dirty_background_ratio
3) /proc/sys/vm/dirty_writeback_centisecs 
这个参数控制内核的脏数据刷新进程pdflush的运行间隔。单位是 1/100 秒。缺省数值是500，也就是 5 秒。如果你的系统是持续地写入动作，那么实际上还是降低这个数值比较好，这样可以把尖峰的写操作削平成多次写操作。设置方法如下：
echo "100" > /proc/sys/vm/dirty_writeback_centisecs
如果你的系统是短期地尖峰式的写操作，并且写入数据不大（几十M/次）且内存有比较多富裕，那么应该增大此数值：
echo "1000" > /proc/sys/vm/dirty_writeback_centisecs
4) /proc/sys/vm/dirty_expire_centisecs 
这个参数声明Linux内核写缓冲区里面的数据多“旧”了之后，pdflush进程就开始考虑写到磁盘中去。单位是 1/100秒。缺省是 30000，也就是 30 秒的数据就算旧了，将会刷新磁盘。对于特别重载的写操作来说，这个值适当缩小也是好的，但也不能缩小太多，因为缩小太多也会导致IO提高太快。
echo "100" > /proc/sys/vm/dirty_expire_centisecs
当然，如果你的系统内存比较大，并且写入模式是间歇式的，并且每次写入的数据不大（比如几十M），那么这个值还是大些的好。
5) /proc/sys/vm/vfs_cache_pressure 
该文件表示内核回收用于directory和inode cache内存的倾向；缺省值100表示内核将根据pagecache和swapcache，把directory和inode cache保持在一个合理的百分比；降低该值低于100，将导致内核倾向于保留directory和inode cache；增加该值超过100，将导致内核倾向于回收directory和inode cache
缺省设置：100
6) /proc/sys/vm/min_free_kbytes 
该文件表示强制Linux VM最低保留多少空闲内存（Kbytes）。
缺省设置：724（512M物理内存）
7) /proc/sys/vm/nr_pdflush_threads 
该文件表示当前正在运行的pdflush进程数量，在I/O负载高的情况下，内核会自动增加更多的pdflush进程。
缺省设置：2（只读）
8) /proc/sys/vm/overcommit_memory 
该文件指定了内核针对内存分配的策略，其值可以是0、1、2。
0， 表示内核将检查是否有足够的可用内存供应用进程使用；如果有足够的可用内存，内存申请允许；否则，内存申请失败，并把错误返回给应用进程。
1， 表示内核允许分配所有的物理内存，而不管当前的内存状态如何。
2， 表示内核允许分配超过所有物理内存和交换空间总和的内存（参照overcommit_ratio）。
缺省设置：0
9) /proc/sys/vm/overcommit_ratio 
该文件表示，如果overcommit_memory=2，可以过载内存的百分比，通过以下公式来计算系统整体可用内存。
系统可分配内存=交换空间+物理内存*overcommit_ratio/100
10) /proc/sys/vm/page-cluster 
该文件表示在写一次到swap区的时候写入的页面数量，0表示1页，1表示2页，2表示4页。
缺省设置：3（2的3次方，8页）
11) /proc/sys/vm/swapiness 
该文件表示系统进行交换行为的程度，数值（0-100）越高，越可能发生磁盘交换。
