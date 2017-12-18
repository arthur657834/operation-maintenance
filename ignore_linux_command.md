```
export HISTCONTROL=ignorespace
执行之后history不会记录已空格开始命令

export HISTSIZE=0 < == > history -cw
禁用当前会话的所有历史记录

set +o history
开始不记录命令

set -o history
恢复记录

history -d [num]
删除某个命令
```
