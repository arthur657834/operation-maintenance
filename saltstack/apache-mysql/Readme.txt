salt-run state.orchestrate myorchestration #salt-run state.orchestrate myorchestration test=True

myorchestration:通过定义状态执行顺序来定义机器部署顺序


salt '*' state.highstate test=True

软件安装时最好自定版本
- version: 2.2.15

或者pkg.installd:=>pkg.latest:
安装最新版

jinja模版配置


