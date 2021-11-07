#!/bin/bash

export ROS_MASTER_URI=http://192.168.0.100.11311

echo -n "[Check] enviroment variable..."
if test -z "${ROS_MASTER_URI}"
then
	echo "error"
	echo "Done"
else 
	echo "Pass"
fi
