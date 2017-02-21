http://www.errbot.io/en/latest/user_guide/setup.html

yum -y install python34 libffi-devel python34-devel
pip install virtualenv
virtualenv --python `which python3` errbot
cd errbot
bin/pip install errbot

#virtualenv --python `which python3` ~/.errbot-ve ~/.errbot-ve/pip install errbot
bin/errbot --init

bin/pip install --upgrade errbot

插件开发:
/root/errbot/plugins/err-example

http://errbot.io/en/latest/user_guide/plugin_development/botcommands.html

https://github.com/errbotio/errbot/wiki
https://alimac.io/writes/adventures-with-errbot-part-1/
