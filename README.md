# CS
CS is short for "Coffee Shell", which is a shell based script built on top of **dialog** components lib, to enable programmers with their time and $s in searching coffee coupons.

## Preparation

### MacOS Users

First you need to install the basic GNU GUI tool named **dialog**
```shell
brew install dialog
```

Secondly, configure and install the shell(or you can simply download this git repo and run the cs.sh shell script)

```shell
./configure

make

make install
```


### Linux Users

#### Ubuntu
todo

#### CentOS
todo

#### Debian
todo



### Usage
Simply call the shell script, make sure you've already set the permissions with **chmod +x path/to/cs.sh**
```shell
./cs.sh
```


### DEMO
![cs_demo](https://drive.google.com/open?id=1wAmIcXofgsXKn7KCMLjcZezAs48b8rzQ)


## Future Plan
+ More coffee brands supports
+ Customatic coupon channels
+ Custonmatic Faas based searching logic
+ Maybe we can order coffee on the terminal eventually(LOL)

