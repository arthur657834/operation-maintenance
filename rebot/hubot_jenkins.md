hubot构建jenkins:
```shell
npm i -S hubot-jenkins
cp /root/myhubot/node_modules/hubot-scripts/src/scripts/jenkins.coffee /root/myhubot/scripts/

export HUBOT_JENKINS_URL=http://10.1.50.250:9088/jenkins/
export HUBOT_JENKINS_AUTH=admin:123456
```

```
myhubot jenkins b <jobNumber> - builds the job specified by jobNumber. List jobs to get number.
myhubot jenkins build <job> - builds the specified Jenkins job
myhubot jenkins build <job>, <params> - builds the specified Jenkins job with parameters as key=value&key2=value2
myhubot jenkins describe <job> - Describes the specified Jenkins job
myhubot jenkins last <job> - Details about the last build for the specified Jenkins job
myhubot jenkins list <filter> - lists Jenkins jobs
```

Tip: 如果要使用 build 要关闭系统设置中的 防止跨站点请求伪造
```
hubot获取jenkins构建通知:
npm install --save hubot-jenkins-notifier
Add it hubot-jenkins-notifier to your external-scripts.json file in your hubot directory
jenkins安装插件Notification plugin
```
![jenkins_config](jenkins.jpg)  

http://10.1.50.250:8080/hubot/jenkins-notify?room=general&trace=1
