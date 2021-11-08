
#!/bin/sh
#check ROS_MASTER_URI
export ROS_MASTER_URI=http://192.168.0.100:11311
echo -n "[check] environment varible... "
if test -z "${ROS_MASTER_URI}";
then
    echo "environment varible of ROS_MASTER_URI is unnull"
else
    echo "Pass"
fi
#check http
check=$(export | grep ROS_MASTER_URI | sed -E "s/.*[0-9]{3}.[0-9]{3}.[0-9].[0-9]{3}.*//")
if [ $check -eq ''];then
    echo "[check] address validation...  Pass"
else
    echo "[check] ping address...        False"
fi 
