```

远程关机权限的获取：
1）修改远程pc的“本地安全策略”，为指定的用户开放权限
  在Windows XP默认的安全策略中，只有Administrators组的用户才有权从远端关闭计算机，如果要给xxxx用户远程关机的权限。可利用Windows XP的“组策略”或“管理工具”中的“本地安全策略”来实现。 
  1.命令行运行gpedit.msc打开“组策略编辑器“；
  2.导航到“计算机配置/Windows 设置/安全设置/本地策略/用户权利指派”； 
  3.修改“从远端系统强制关机”，添加xxxx用户即可。

2）获得远程IPC管理权限
如果配置第一步后还出现“拒绝访问。”，则需要在运行shutdown命令前先运行如下命令
net use \\[ip地址或计算机名]\ipc$ password /user:xxxx
其中password为帐号xxxx的登录密码。

net user administrator /delete

net use \\10.1.12.17\ipc$ broad_123 /user:administrator 

shutdown -s -m \\10.1.12.24 -t 10
```
