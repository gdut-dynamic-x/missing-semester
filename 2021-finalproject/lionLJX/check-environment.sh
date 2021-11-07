#!/bin/bash

#check the environment variable 
export | grep ROS_MASTER_URI
RETURN=$?
        printf  "[check] environment variable..."
if [ $RETURN == "0" ];then
	echo  " pass"
else 
	echo  "This environment variable is empty!"
	exit 0
fi

#check the environment variable whether have a valid address
	printf  "[check] address validation..."
if [ $ROS_MASTER_URI == 'http://localhost:11311' ];then
	echo  "pass"
else 
	echo  "The address isn't valid"
fi

#ping address to check ip
ping -c 1 $ROS_IP


