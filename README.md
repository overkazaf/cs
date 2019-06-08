# CS
CS is short for "Coffee Shell", which is a shell based script built on top of **dialog** components lib, to enable programmers with their time and $s while searching coffee coupons.

## Preparation

### MacOS Users

First you need to install the basic GNU GUI tool named **dialog**
```shell
brew install dialog
```

Secondly, configure and install the shell(or you can simply download this git repo and run the cs.sh shell script)
```shell
./cs.sh
```

**TRY IT LATER**
```shell
./configure

make

make install
```


### Linux Users
#### Ubuntu
```shell
apt-get install dialog
```

#### CentOS
```shell
yum install dialog
```


### Usage
Simply call the shell script, make sure you've already set the permissions with **chmod +x path/to/cs.sh**
```shell
./cs.sh
```


### DEMO
![cs_demo](https://i.loli.net/2019/06/08/5cfb88216fd3929407.gif)

### Tips
JSESSIONID field will be expired in some hours, so we should update this value from relogging in, this compromise will be handled ASAP.

## Future Plan
+ More coffee brands supports
+ Customatic coupon channels
+ Custonmatic Faas based searching logic
+ Maybe we can order coffee on the terminal eventually(LOL)