#########################################################################
# File Name: jsessionid.sh
# Author: overkazaf
# mail: overkazaf@gmail.com
# Created Time: 五  6/ 7 01:07:04 2019
#########################################################################
#!/bin/bash

tmp=$(mktemp -t tmp.xxxxdfsdfaeeewww)

function get_jsessionid {
	local filename=$1
	echo $(cat $filename) | awk -F " " '{print $26}' | awk -F "=" '{print $2}' | sed 's/\"//' >$tmp
}

function update_jsessionid {
	target_file="curl_template.txt"
	sample_file="sample.txt"

	get_jsessionid $target_file
	old_jsessionid=$(cat $tmp)
	get_jsessionid $sample_file
	new_jsessionid=$(cat $tmp)

	# Replace the JSESSIONID in target_file

	old=$(cat $target_file)
	new_content=${old/$old_jsessionid/$new_jsessionid}

	echo $new_content >$target_file

	echo "JSESSIONID has been successfully updated to $new_jsessionid"
	echo ""

	rm -rf $tmp >/dev/null
}