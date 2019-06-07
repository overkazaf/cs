#########################################################################
# File Name: test.sh
# Author: overkazaf
# mail: overkazaf@gmail.com
# Created Time: 五  6/ 7 01:07:04 2019
#########################################################################
#!/bin/bash

tmp_curl=$(mktemp -t tmp.curl_xxsafksdfladf)

function call_curl {
  curl -X GET -H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16C101 MicroMessenger/7.0.4(0x17000428) NetType/4G Language/zh_CN" -H "Cookie: JSESSIONID=51F17E3ADDD8EB5DC7908D93A947AE0C" -H "X-Requested-With: XMLHttpRequest" -H "Host: tq.365taoquan.cn" -H "Referer: http://tq.365taoquan.cn/seller/?productId=21&agentId=88" "http://tq.365taoquan.cn/seller//commodity/21?_=1559884551901" \
	| jq -r 'map(select(.commodityProperty=="TICKET"))|map(.name,.sellingPrice)|reduce .[] as $item (""; if $item|type == "number" then .+"  【￥"+($item|tostring)+"】####" else .+$item end)|split("####")|.[0:-1]|join("\n")' > $tmp_curl
}

function fetch_starbucks {
	call_curl 21
	echo $(cat $tmp_curl) >starbucks.txt
}

fetch_starbucks