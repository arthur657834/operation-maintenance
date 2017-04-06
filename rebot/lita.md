https://docs.lita.io/

yum -y install rubygems ruby-devel
Installing Redis
gem install lita 
lita new botname

修改Gemfile
# Uncomment to use the HipChat adapter
#gem "lita-hipchat"
bundle install
bundle exec lita

bundle根据Gemfile安装依赖

启动报错
[root@lj-master-250 bot]# bundle exec lita
bundler: failed to load command: lita (/usr/local/bin/lita)
LoadError: cannot load such file -- puma/puma_http11
  /usr/local/share/gems/gems/puma-3.7.1/lib/puma/server.rb:15:in `require'
  /usr/local/share/gems/gems/puma-3.7.1/lib/puma/server.rb:15:in `<top (required)>'
  /usr/local/share/gems/gems/lita-4.7.1/lib/lita/robot.rb:222:in `block in run_app'

估计是puma版本的问题

require 'puma/puma_http11'

find: ‘/run/user/42/gvfs’: Permission denied
/usr/local/lib64/gems/ruby/puma-3.7.1/lib/puma/puma_http11.so
/usr/local/share/gems/gems/puma-3.7.1/ext/puma_http11
/usr/local/share/gems/gems/puma-3.7.1/ext/puma_http11/org/jruby/puma
/usr/local/share/gems/gems/puma-3.7.1/ext/puma_http11/puma_http11.c
/usr/local/share/gems/gems/puma-3.7.1/ext/puma_http11/puma_http11.o
/usr/local/share/gems/gems/puma-3.7.1/ext/puma_http11/puma_http11.so
[root@lj-master-250 bot]# 

/usr/local/share/gems/gems/puma-3.7.1/lib/puma/server.rb


require 'puma/thread_pool'
require 'puma/const'
require 'puma/events'
require 'puma/null_io'
require 'puma/compat'
require 'puma/reactor'
require 'puma/client'
require 'puma/binder'
require 'puma/delegation'
require 'puma/accept_nonblock'
require 'puma/util'


gem source
gem update [--system]
gem install [gemname] --version=[ver]
gem uninstall [gemname]
gem list [--local]
gem search log
gem cleanup
gem environment 

配置文件:
lita_config.rb

Lita.configure do |config|
  config.robot.name = "Lita Bot"
  config.robot.adapter = :hipchat
  config.adapters.hipchat.jid = "12345_123456@chat.hipchat.com"
  config.adapters.hipchat.password = "secret"
  config.adapters.hipchat.debug = true
  config.adapters.hipchat.rooms = :all
end

语言配置:
vi config.robot.locale
Lita.configure do |config|
  # Tries Mexican Spanish, falling back to Spanish, and then to English.
  config.robot.locale = "es-MX"

  # Tries Spanish, falling back to English.
  config.robot.locale = "es"
end

取得slack的token
https://kingkom.slack.com/services/new/lita



