```
set 
打印环境变量

set c 
打印c开头的环境变量

set var=abc / set var="abc"
设置var的值为abc/"abc"

set /p var=请输入变量的值：
echo 你输入的值是：%var%
设置变量为输入值

set /a var*=2 / set /a varF=0"^"0
数学运算

set src= China I love you
set des=%src:love=hate%
字符串替换

set src=www.baidu.com.cn
set des=%src:~1,2% / set des=%src:~-5%
取前1,2 / 取最后5个
```

```bat
ex1.
@echo off
CLS
color 9f
echo 0%%  50%%  100%%
set /p a=[<nul
for /l %%a in (1,1,36) do (
ping -n 1 127.0.0.1>nul
set /p a=^><nul
)
set /p a=]<nul
rem ^> 输出>
rem <NUL是指将NUL转给A(取消等待输入)
pause
```
