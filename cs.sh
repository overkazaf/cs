*************************************************************************
#    > File Name: cs.sh
#    > Author: overkazaf
#    > Mail:overkazaf@gmail.com 
#    > Created Time: 五  6/ 7 00:09:18 2019
#************************************************************************

#!/bin/bash

set +x

temp=$(mktemp -t tmp.xxxxxyyyyyzzzzz)
temp2=$(mktemp -t tmp.sadfaldfjksdfjkasdf)
tmp_curl=$(mktemp -t tmp.curl_xxsafksdfladf)
searched_name=$(mktemp -t tmp.searchedxxxxxx)

function others {
	dialog --inputbox "Enter the coffee brand to search: " 20 40 2> $searched_name
}

function call_curl {

  curl -X GET -H "User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16C101 MicroMessenger/7.0.4(0x17000428) NetType/4G Language/zh_CN" -H "Cookie: JSESSIONID=51F17E3ADDD8EB5DC7908D93A947AE0C" -H "X-Requested-With: XMLHttpRequest" -H "Host: tq.365taoquan.cn" -H "Referer: http://tq.365taoquan.cn/seller/?productId=21&agentId=88" "http://tq.365taoquan.cn/seller//commodity/21?_=1559884551901" \
	| jq -r 'map(select(.commodityProperty=="TICKET"))|map(.name,.sellingPrice)|reduce .[] as $item (""; if $item|type == "number" then .+"  【￥"+($item|tostring)+"】####" else .+$item end)|split("####")|.[0:-1]|join("\n")' > $tmp_curl
  
  echo $(cat $tmp_curl) >starbucks.txt
}

function fetch_starbucks_list {
	call_curl
}

function get_starbucks {
	call_curl
	dialog --textbox $tmp_curl 20 50
}

function foo {
	dialog --msgbox "foo" 20 40 
}


while [ 1 ]
do
	dialog --menu "Coffee Menu" 20 40 10 \
		1 "Starbucks" \
		2 "Costa" \
		3 "Peet's" \
		4 "Luckin Coffee" \
		5 "Others" \
		0 "Exit" 2> $temp  
	if [ $? -eq 1 ]
	then
		break;
	fi

	selection=$(cat $temp)
	#echo $selection > selection.txt

	case $selection in
		1)
			get_starbucks ;;
		2)
			foo ;;
		3)
			foo ;;
		4)
			foo ;;
		5)
			others ;;
		0)
			break ;;
		*)
			dialog --msgbox "Selection error" ;;
	esac
done


set -x

rm -rf $temp 2>/dev/null
rm  -rf $temp2 2>/dev/null
rm -rf $tmp_curl 2>/dev/null
rm  -rf $searched_name 2>/dev/null
