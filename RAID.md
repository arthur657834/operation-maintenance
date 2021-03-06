### RAID0:
是通过将数据分开读写到多块硬盘的方式来提高读写性能，至少需要2块硬盘
1. 空间利用率：所有硬盘空间之和
2. 性能：所有硬盘读写速度之和
3. 冗余能力：无

### RAID1:
在写数据时会将数据复制到多块硬盘上，即每块硬盘都会保存该数据的一个备份，在读数据时，以提高冗余性。读的时候同时从多块硬盘上读取数据，以提高读的性能。
1. 空间利用率：所有磁盘中最小的那块(其实在使用RAID时，最好每块硬盘的大小及型号都一样)
2. 性能：读性能是所有硬盘之和，写性能有所减弱
3. 冗余能力：只要有一块硬盘正常，数据就正常

### RAID5:
至少需要3块硬盘，RAID5与RAID0类似，读写数据的时候会将数据分布的读写到所有硬盘上。但是在写数据的时候RAID5会对数据进行奇偶校验运算，并将校验信息也保存在了硬盘上，所以即使我们其中一块硬盘发生了损坏，RAID5也能通过其他硬盘以及校验信息对数据进行恢复使用。但是如果2块或者2块以上的硬盘发生了损坏，整个数据也就损坏了。
1. 空间利用率：1 - 1/n
2. 性能：读性能接近RAID0，写性能相比RAID0要弱一些
3. 冗余能力：可以接受1块硬盘的损坏

### RAID6:
至少需要4块硬盘，RAID6与RAID5相类似，读写数据的时候会将数据分布的读写到所有硬盘上。在写数据的时候RAID5会对数据进行奇偶校验运算，并将校验信息也保存在了硬盘上，但是RAID6会比RAID5多保存一份校验信息，所以RAID6的冗余性比RAID5就有所提升，可以允许2块硬盘发生损坏。
1. 空间利用率：1 - 2/n
2. 性能：读性能接近RAID5，写性能相比RAID5还要弱一些
3. 冗余能力：可以接受2块硬盘的损坏

