#*************************************************************************
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

DOMAIN="http://159.203.118.69"
PORT="7777"

function others {
	dialog --inputbox "Enter the coffee brand to search: " 20 40 2> $searched_name
}

function show_textbox {
	dialog --textbox $tmp_curl 20 50
}

# Getting template from my VPS
function get_curl_template {
  curl -X GET "$DOMAIN:$PORT" >$temp
}

function call_curl_by_template {
  get_curl_template
  local cmd
  cmd=$(cat $temp)
  str=$1
  # TODO: Replace the JSESSIONID first
  cmd=${cmd//####/$str} # Replace the commodity id
  sh -c "$cmd" >$temp
}

function get_starbucks {
	call_curl_by_template 21
	cat $temp | \
	jq -r 'map(select(.commodityProperty=="TICKET"))|map(.name,.sellingPrice)|reduce .[] as $item (""; if $item|type == "number" then .+"  【￥"+($item|tostring)+"】####" else .+$item end)|split("####")|.[0:-1]|join("\n")' > $tmp_curl
  
	echo $(cat $tmp_curl) >starbucks.txt
	
	show_textbox
}

function get_costa {
	call_curl_by_template 28
	cat $temp | \
	jq -r 'map(select(.commodityProperty=="TICKET"))|map(.name,.sellingPrice)|reduce .[] as $item (""; if $item|type == "number" then .+"  【￥"+($item|tostring)+"】####" else .+$item end)|split("####")|.[0:-1]|join("\n")' > $tmp_curl

	echo $(cat $tmp_curl) >costa.txt
	
	show_textbox
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
			get_costa ;;
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
