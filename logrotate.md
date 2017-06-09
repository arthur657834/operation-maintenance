
yum install logrotate -y

touch /var/log/log-file
head -c 10M < /dev/urandom > /var/log/log-file 


vi /etc/logrotate.d/log-file 

/var/log/log-file {
    monthly
    rotate 5
    compress
    delaycompress
    missingok
    notifempty
    create 644 root root
    postrotate
        /usr/bin/killall -HUP rsyslogd
    endscript
}

monthly: 日志文件将按月轮循。其它可用值为‘daily’，‘weekly’或者‘yearly’。

rotate 5: 一次将存储5个归档日志。对于第六个归档，时间最久的归档将被删除。

compress/nocompress: 在轮循任务完成后，已轮循的归档将使用gzip进行压缩。

copytruncate/nocopytruncate：用于还在打开中的日志文件，把当前日志备份并截断

delaycompress/nodelaycompress: 总是与compress选项一起用，delaycompress选项指示logrotate不要将最近的归档压缩，压缩将在下一次轮循周期进行。这在你或任何软件仍然需要读取最新归档时很有用。

nocreate：不建立新的日志文件

missingok: 在日志轮循期间，任何错误将被忽略，例如“文件无法找到”之类的错误。

ifempty/notifempty: 如果日志文件为空，轮循不会进行。

errors address：专储时的错误信息发送到指定的Email 地址

mail address/nomail：把转储的日志文件发送到指定的E-mail 地址

olddir directory：转储后的日志文件放入指定的目录，必须和当前日志文件在同一个文件系统
noolddir：转储后的日志文件和当前日志文件放在同一个目录下

create 644 root root: 以指定的权限创建全新的日志文件，同时logrotate也会重命名原始日志文件。

postrotate/endscript: 在所有其它指令完成后，postrotate和endscript里面指定的命令将被执行。在这种情况下，rsyslogd 进程将立即再次读取其配置并继续运行。

postrotate/endscript：在转储以后需要执行的命令可以放入这个对，这两个关键字必须单独成行

sharedscripts：所有的日志文件都轮转完毕后统一执行一次脚本

size size：当日志文件到达指定的大小时才转储，Size 可以指定 bytes (缺省)以及KB (sizek)或者MB

调试:
logrotate /etc/logrotate.conf 
logrotate /etc/logrotate.d/log-file

logrotate -d /etc/logrotate.d/log-file 
-d 选项以预演方式运行logrotate
-f 选项来强制logrotate轮循日志文件
-v 参数提供了详细的输出。
–s /var/log/logrotate-status 指定执行日志




