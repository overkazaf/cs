#########################################################################
# File Name: test.sh
# Author: overkazaf
# mail: overkazaf@gmail.com
# Created Time: 五  6/ 7 01:07:04 2019
#########################################################################
#!/bin/bash

temp=$(mktemp -t tmp.xxdjdjslfdsdf)

dialog --menu "Coffee Menu" 20 40 10 1 "Starfucks" 0 "Exit" 2> temp
echo $?
