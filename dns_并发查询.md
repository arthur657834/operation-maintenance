pip install dnsyo --upgrade

dnsyo -t 100 -q ALL www.ttlsa.com -s

 --simple选项采用简单的输出模式
 --extended

dnsyo --resolverfile /root/dns-list.yaml www.ttlsa.com -x

dns-list.yaml
```yaml
 - country: CN
  ip: 114.114.114.114
  provider: 114 DNS
  reverse: 114 DNS
```
  
