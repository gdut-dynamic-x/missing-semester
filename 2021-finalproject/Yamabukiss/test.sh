#!/bin/bash

# test the enviroment valiable
export | grep ROS_MASTER_URI
a=$?
if [ $a != "0" ]; then 
	echo "the enviroment variable have't been seted"
else 
	echo "the enviroment variable have been seted"
fi

#check the http address is available or not 
url=$(export | grep ROS_MASTER_URI | sed -E "s/.*=//" | sed -E "s/\"//" | sed -E "s/\"//")
sign=$(echo $url | awk '/^http:\/\/.*:[0-9]+/{print $0}')
if [ "$sign" == '' ]; then
	echo "the http address is unavailable"
else 
	echo "the http address is availale"
fi

# test the connection of ip 
ip=$(echo $url | sed -E "s/http:\/\///" | sed -E "s/:.*//")
ping -c 1  "$ip"
b=$?
if [ "$b" != '0' ]; then
	echo "the ip address is not available" 
else 
	echo "the ip address is available"
fi

# judge if the local ip is in the same subnet with target ip
echo "local ip configuration:"
ifconfig | awk '/netmask/{print $0}'  | awk 'NR==1'
echo "target ip is:"
echo $ip
echo "they are't in the same subnet"
