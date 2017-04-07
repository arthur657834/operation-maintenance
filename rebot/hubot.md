https://hubot.github.com/docs/scripting/
https://hubot.github.com/docs/adapters/

npm install -g yo generator-hubot
```shell
mkdir -p myhubot /root/.npm/hubot-help
chmod g+rwx /root /root/.config /root/.config/configstore myhubot 
chmod -R g+rwx /root/.npm
cd myhubot
yo hubot
```
什么是 adapter ？ 
所谓的 adapter 其实是一些让机器人接收输入的接口。

npm install --save hubot-telegram
 
./bin/hubot -a telegram

#scripts下放着执行命令

module.exports = (robot) ->
  robot.hear /badger/i, (res) ->
    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  
  #excute commad: botname open the (.*) doors
  robot.respond /open the (.*) doors/i, (res) ->
    doorType = res.match[1]
    if doorType is "pod bay"
      res.reply "I'm afraid I can't let you do that."
    else
      res.reply "Opening #{doorType} doors"

  robot.hear /I like pie/i, (res) ->
    res.emote "makes a freshly baked pie"
    
https://github.com/arthur657834/hubot-scripts
