```bat
@echo off 
rem EQU - 等于 
rem NEQ - 不等于 
rem LSS - 小于 
rem LEQ - 小于或等于 
rem GTR - 大于 
rem GEQ - 大于或等于

IF [NOT] ERRORLEVEL number command
IF [NOT] string1==string2 command
IF [NOT] EXIST filename command
增强用法：IF [/I] string1 compare-op string2 command
if defined str3 (echo str3已经被定义) else echo str3 没有被定义
pause>nul

```
