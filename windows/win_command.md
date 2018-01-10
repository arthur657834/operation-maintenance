```
type 2.txt / more 2.txt
显示文件内容

pushd c:\mp3 // 将当前目录d:\mp4入栈，并切换当前目录为c:\mp3
popd  // 将刚才保存的d:\mp4弹栈，并设置为当前目录

ren rec.txt rec.ini 
重命名

tree 
显示目录结构

md  
创建目录

rd  删除目录空文件夹
rd /s /q d:\test 删除所有文件安

copy /Y jobs c:\doc 
copy /Y key1.txt + key2.txt key.txt
拷贝文件

xcopy c:\bat\hai d:\hello\ /y /h /e /f /c    // 将c:\bat\hai中的所有内容拷贝到d:\hello中  注意：需要在hello后加上\  表示hello为一个目录，否则xcopy会询问hello是F，还是D

xcopy c:\bat\hai d:\hello\ /d:12-29-2010  
将c:\bat\hai中的2010年12月29日后更改的文件拷贝到d:\hello中

move 1.png d:\test\2.png
同linux mv

del /f /s /q test d:\test2\*.doc 
删除文件

replace d:\love.mp3 d:\mp3 
强制替换

mklink  
创建符号链接（win7引入）；创建的符号链接文件上会有一个类似快捷方式的箭头
win7下的mklink命令通过指定参数可以建立出不同形式的文件或目录链接，分为硬链接(hard link)、符号链接(symbolic link)和目录联接(junction)三种。

assoc 
设置'文件扩展名'关联到的'文件类型'
assoc .txt=txtfile

ftype 设置'文件类型'关联到的'执行程序和参数'
ftype txtfile=C:\Windows\notepad.exe %1 // 设置txtfile类型关联的命令行为：C:\Windows\notepad.exe %1

attrib  
查看或修改文件或目录的属性  【A：存档  R：只读  S：系统  H：隐藏】
attrib +H movie  // 隐藏movie文件夹

forfiles 递归目录执行命令
forfiles /p c:\myfiles /m .svn /s /c "cmd /c svn up -r12005" // 在c:\myfiles目录下查找含有.svn的文件或目录（递归子目录），并对该目录执行指定版本号svn更新

prompt orz:   
// 将命令提示符修改为orz:

net
title
arp
ping
telnet
ftp
ipconfig
netstat
nslookup
tasklist
taskkill
time
date
vol
ver
winver
cls
pause
systeminfo
wmic
logoff
shutdown
format
regsvr32
reg
chkdsk
findstr

find /N /I "pid" 1.txt  
在1.txt文件中忽略大小写查找pid字符串，并带行号显示查找后的结果

at  
计划任务（必须保证“Task Scheduler”服务启动   net start "task scheduler"）

cscript /Nologo mac.vbs  
执行mac.vbs脚本，显示本机mac地址

subst   
磁盘映射  -- 磁盘映射信息都保存在注册表以下键值中：HKEY_CURRENT_USER\Network
subst y: e:\src  // 将e:\src映射为本地y盘

cmdkey   
凭据（保存的用户名和密码）
cmdkey /add:Domain:target=10.12.190.82 /user:LiLei /pass:123456  // 添加凭据

call 1.bat
执行完原脚本才会往下执行
start 1.bat
原脚本继续执行，不会等1.bat脚本执行完

start /max notepad.exe

exit /B 1  // 退出当前bat脚本，并将ERRORLEVEL系统变量设置为1

color 02 // 将背景色设为黑色，将字体设为绿色
--------------------------------------
0 = 黑色 8 = 灰色
1 = 蓝色 9 = 淡蓝色
2 = 绿色 A = 淡绿色
3 = 浅绿色 B = 淡浅绿色
4 = 红色 C = 淡红色
5 = 紫色 D = 淡紫色
6 = 黄色 E = 淡黄色
7 = 白色 F = 亮白色

mode con cols=113 lines=15
改变cmd窗口的大小
```

