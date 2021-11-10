#!/usr/bin/bash                                                                                                                                                 
#检查ROS——MASTER——URI是否为空
printf '%-32s' '[Check] environment variable...'                                
if [[ -n "$ROS_MASTER_URI" ]]; then                                             
    echo "Pass"                                                                 
else                                                                            
    echo "Fail"                                                                 
    check_env=err                                                               
fi                                                                              
#检查环境变量是否为有效的ip地址                                                                                
if [[ -n "$check_env" ]]; then                                                  
    printf '%-32sFail\n' '[Check] address validation...'                        
else                                                                            
    printf '%-32s' '[Check] address validation...'                              
    add_val=$(echo $ROS_MASTER_URI | perl -lne '                                
    print +(m| ^http:// ((?:\d{1,3}\.){3} \d{1,3}) : (\d{1,5})$ |gx             
            && (0 + grep { $_ < 256 } split /\./, $1) == 4                      
            && $2 < 65536) ? "Pass" : "Fail";                                   
    ')                                                                          
    echo "$add_val"                                                             
    [[ $add_val == "Fail" ]] && check_add_val=err                               
fi
