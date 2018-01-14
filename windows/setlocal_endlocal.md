``
设置”命令扩展名”和”延缓环境变量扩充”
SETLOCAL ENABLEEXTENSIONS             #启用"命令扩展名"
SETLOCAL DISABLEEXTENSIONS            #停用"命令扩展名"
SETLOCAL ENABLEDELAYEDEXPANSION       #启用"延缓环境变量扩充"
SETLOCAL DISABLEDELAYEDEXPANSION      #停用"延缓环境变量扩充"
ENDLOCAL                              #恢复到使用SETLOCAL语句以前的状态
“命令扩展名”默认为启用
“延缓环境变量扩充”默认为停用
批处理结束系统会自动恢复默认值
可以修改注册表以禁用"命令扩展名"，详见 cmd /? 。所以用到"命令扩展名"的程
序，建议在开头和结尾加上 SETLOCAL ENABLEEXTENSIONS 和 ENDLOCAL 语句，以确
保程序能在其它系统上正确运行
"延缓环境变量扩充"主要用于 if 和 for 的符合语句，在 set 的说明里有其实用例程
```
