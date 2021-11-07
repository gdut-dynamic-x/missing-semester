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

