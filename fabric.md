```shell
pip install fabric
```

```
from fabric.api import *
from fabric.context_managers import *
 
local    #执行本地命令，如local('uname -s')
lcd      #切换本地目录，如lcd('/home'),切换目录操作只对fab相关的命令有效！！针对其他python的语句，切换目录可以使用os.chdir()
cd       #切换远程目录
run     #执行远程命令
sudo   #sudo方式执行远程命令，如sudo('/etc/init.d/httpd start')
put     #上次本地文件导远程主机，如put('/home/user.info','/data/user.info'，use_sudo=True) 可获取权限
get     #从远程主机下载文件到本地，如：get('/data/user.info','/home/user.info')
prompt  #获得用户输入信息，如：prompt('please input user password:')
confirm  #获得提示信息确认，如：confirm('Test failed,Continue[Y/N]?')
reboot   #重启远程主机，如：reboot()
env.hosts   #定义目标主机，可以用IP或主机名表示，以python的列表形式定义。如env.hosts=['192.168.1.21','192.168.1.22']
env.exclude_hosts   #排除指定主机，如env.exclude_hosts=['192.168.1.21']
env.user   #定义用户名，如env.user='root'
env.port   #定义端口，默认为22，如env.port='22'
env.password   #定义密码，如env.password='123456'
env.passwords  #定义多个密码，不同主机对应不同密码，如：env.passwords ={'root@192.168.1.21:22':'123456','root@192.168.1.22:22':'654321'}
env.roledefs   #定义角色分组，比如web组合db组主机区分开来：env.roledefs ={'webserver':['192.168.1.21','192.168.1.22'],'dbserver':['192.168.1.25','192.168.1.26']}
fabric.colors  #提供彩色输出, 导入后, green(text, bold=False)，支持七个颜色(blue/green/cyan/magenta/red/white/yellow)
@parallel      #装饰器，可以并行运行任务，pool_size=5为最大并行运行任务的个数
@serial 串行
@runs_once
shell_env(JAVA_HOME='/opt/java')
```

ex:
```python

from fabric.api import *
from fabric.context_managers import *
from fabric.colors import *
from fabric.contrib.console import confirm
 
env.hosts = '10.1.2.77'
env.user = 'root'
env.password = 'xxx123'

#env.hosts = ['root@10.1.61.220','root@10.1.61.228','root@10.1.61.229']
#env.passwords = {
#    'root@10.1.60.223:22': "x123",
#    'root@10.1.60.224:22': "x123",    
#}
#env.parallel = True

env.roledefs = {
    'apm': ['10.1.11.178'],
    'docker': ['10.1.2.77']
}

def docker():
    with lcd('D:/APM'):
        local('dir')
 
    with cd('/home'):
        run('ls')
 
def tt():
    put(r'D:\APM\Code\interface\show\fabfile.pyc', r'\home')
    get(r'\home', r'D:\APM\Code\interface\show')
    certain = prompt("your name?")
    print certain
    if confirm("are you robot?"):
        print green("******hello, robot****")
 
def word(whole=1):
    if whole == 3:
        print "oaaaa"
    else:
        print "aoooo"

def hello(name, value):
    print "Hello Fabric! %s=%s" % (name,value)
#fab hello:name=Year,value=2016

@roles('apm')
def  ror():
    run('ifconfig eth0')
 
@roles('docker')
def dd():
    run('docker ps')
 
@parallel(pool_size=5)
def runs():
    run('ip a')
    pass
 
def task():
    execute(build)
    execute(deploy)
    
 ```
 
 
 command：
 ```
 fab dd #执行命令
 
 fab -l
 
 fab -f script.py hello
 
 fab -H bjhee@example3.com,bjhee@example4.com hello
 
 fab -R build deploy
 
 fab -P hello
 
 ```
 
# 颜色处理:
 ```
 print green("Successful")
 print yellow("Warning")
 print red("Error")
 ```
 # 错误处理:
 默认情况下，Fabric在任务遇到错误时就会退出，如果我们希望捕获这个错误而不是退出任务的话，就要开启”warn_only”参数。在上面介绍”settings()”上下文管理器时，我们已经看到了临时开启”warn_only”的方法了，如果要全局开启，有两个办法：
 1. fab -w hello
 2. env.warn_only = True
 
 ```python
 upload = put('/tmp/myapp-0301.tar.gz', 'myapp.tar.gz')
        if upload.failed:
            sudo('rm myapp.tar.gz')
            put('/tmp/myapp-0301.tar.gz', 'myapp.tar.gz', use_sudo=True)
```
