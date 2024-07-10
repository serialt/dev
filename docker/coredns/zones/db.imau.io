$TTL 3600 ; 记录超时时间
$ORIGIN local.com. ; 指定 origin，下面的@符号可以作为他的别名，注意后面的.
; SOA 格式 [domain_name] IN SOA [域主服务器或主DNS服务器名] [管理员email] (时间信息)
@           IN  SOA  ns1.local.com. t.local.com. (
                     2019071601 ; Serial
                     4H         ; Refresh
                     1H         ; Retry
                     7D         ; Expire
                     4H )       ; Negative Cache TTL

; 配置 DNS 记录，指向 ns1.local.com
@           IN  NS   ns1
; 配置 ns1.local.com 的 A 记录, 指向coredns所在的机器
ns1         IN  A    10.0.2.3
; 配置 local.com 的 A 记录，指向网站或其他用途的机器
@           IN  A    10.0.16.10
git           IN  A    10.0.16.10
drone           IN  A    10.0.16.10
drone-runner           IN  A    10.0.16.10
www           IN  A    10.0.16.10
ccc           IN  A    10.0.16.10
grafana IN A 10.0.16.10
prom IN A 10.0.16.10
alert IN A 10.0.16.10


; 配置泛域名，没有准确的三级子域名的域名全部指向此IPV4地址
*           IN  A    10.0.16.10
