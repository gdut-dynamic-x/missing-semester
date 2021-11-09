
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
check=$(export | grep ROS_MASTER_URI | sed -E "s/([0-9]{3}.[0-9]{3}.[0-9].[0-9]{3})/\1/")
if [ $Check -eq ''];then
    echo "[Check] address validation...  Pass"
else
    echo "[Check] ping validation...     False"
fi 


#check ping
ip=$(export | grep ROS_MASTER_URI | sed -E "s/.*([0-9]{3}.[0-9]{3}.[0-9].[0-9]{3}).*/\1/")
total="0"
line="0"
while [ "$total" -le 5 ]; do
    line='ping $ip -c 1 -s 1 -W 1 | grep "100% packet loss" |wc -l'
    if [ "${line}" != "0" ]; then
        total=$((total+1))
    else
        total="0"
        echo "[Check] ping address...        Pass"
    fi
    if [ "${total}" == "5" ]; then
        echo "[Check] ping address...        False"
    fi
done        


#check subnet
subnet=$(ifconfig | grep -E "netmask" | sed -E "s/([0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]){1}/\1/")
echo $subnet
