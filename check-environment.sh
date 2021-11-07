#!/bin/sh
#check ROS_MASTER_URI
export ROS_MASTER_URI=http://192.168.0.100:11311
echo -n "[check] environment varible..."
if test -z "${ROS_MASTER_URI}";
then
    echo "environment varible of ROS_MASTER_URI is null"
else
    echo "environment varible of ROS_MASTER_URI is unnul"
fi

