报错：
E-mail error: “Could not read message file”

解决办法：
http://linux.goeszen.com/e-mail-error-could-not-read-message-file.html

排查过程：
抓包发现是在list的时候报的这个错，最近邮箱服务器做了一次清理，怀疑在清理之前有一部分人未做最后的邮件收发，导致最后的邮件列表与服务器上的存储不一致导致

命令直接登陆服务器删除，不安全啊
