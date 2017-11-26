#!/bin/bash
# A simple bash script alarm to mimic a "natural" sunrise light wake-up.
#
# This code is under MIT license, you can find the complete file here:
# https://github.com/Gregory-K/tplight-circadian-alarm
#

# enter your bulb's IP address
bulb=xxx.xxx.xxx.xxx

echo "What time do you want to wakeup? (HH:MM)"
read target

# convert wakeup time to seconds
target_h=`echo $target | awk -F: '{print $1}'`
target_m=`echo $target | awk -F: '{print $2}'`
target_rh=`dc -e "$target_h 1 - p"`
target_s_t=`dc -e "$target_rh 60 60 ** $target_m 60 *+p"`

# get current time and convert to seconds
clock=`date | awk '{print $4}'`
clock_h=`echo $clock | awk -F: '{print $1}'`
clock_m=`echo $clock | awk -F: '{print $2}'`
clock_s=`echo $clock | awk -F: '{print $3}'`
clock_s_t=`dc -e "$clock_h 60 60 ** $clock_m 60 * $clock_s ++p"`

# calculate difference in times, add number of sec. in day and mod by same
sec_until=`dc -e "24 60 60 **d $target_s_t $clock_s_t -+r%p"`

echo "Sun will rise at $target_rh:$target_m."

sleep $sec_until

echo "Sunrise begins!"

# rise
tplight on $bulb -b 5
tplight temp $bulb 2700
sleep 300
# 00:05
tplight on -t 300000 $bulb -b 25
sleep 300
# 00:10
tplight on -t 600000 $bulb -b 35
sleep 600
# 00:20
tplight temp -t 30000 $bulb 3000
tplight on -t 600000 $bulb -b 50
sleep 600
# 00:30
tplight temp -t 300000 $bulb 3700
tplight on -t 600000 $bulb -b 70
sleep 600
# 00:40
tplight temp -t 30000 $bulb 4000
tplight on -t 600000 $bulb -b 100
# 00:50
