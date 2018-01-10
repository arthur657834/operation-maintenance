```bat
for %%i in (1 2 3 4 5) do @echo %%i
for /l %%i in (1,2,10) do echo %%i
for /d /r %%i in (*) do echo %%i
rem /d 遍历目录，不能列举带隐藏属性的目录
rem /r 遍历子目录，不能列举带隐藏属性的目录
rem for /r f:\test %%i in (a b c) do echo %%i
rem 会对所有目录分别添加abc 输出，要注意
rem 全目录时用dir /ad /b /s
echo 1 >1.txt
echo 2 >>1.txt
for /f %%i in (1.txt) do echo %%i
del 1.txt
for /f "delims=, tokens=3,4" %%i in (test3.txt) do echo %%i %%j
for /f "delims=, tokens=1,*" %%i in (test3.txt) do echo %%i %%j
rem tokens=1-3
rem delims=,-     （减号后有一空格）以逗号减号和空格为分隔符，空格必须放在最后
rem 依切分字符，将字符串从左往右切分成紧跟在*之前最大数值所表示的节数之后，字符串的其余部分保持不变，且整体被*所表示的一个变量接收。
rem skip=2 跳过前两行
rem eol=; 忽略;开头的行
pause
```
