#!/bin/bash

#check the environment variable 
export | grep ROS_MASTER_URI
RETURN=$?
        printf  "[check] environment variable..."
if [ $RETURN == "0" ];then
	echo  " pass"
else 
	echo  "This environment variable is empty!"
fi

#check the environment variable whether have a valid address
	printf  "[check] address validation..."

if [ $ROS_MASTER_URI  == 'http://localhost:11311' ];then 
	echo  "pass"
else 
	echo  "The address isn't valid"
fi

#ping address to check ip
export | grep ROS_MASTER_URI
ip=$?
	printf "[check] ping address..."
ping -c 1 "$ip"
address=$(ping -c  "$ip")
if [ address != "" ];then
	echo "pass"
	echo "All check pass"
else
	echo "the ip address couldn't be connected"
fi
exit 1

shell:/bin/bash -e {0}
