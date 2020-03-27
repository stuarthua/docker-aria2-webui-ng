#!/bin/sh

echo "trackers update task start..."
curl -so /tmp/trackers_all.txt "https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt"
# wget -qP --no-check-certificate /tmp https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt
Newtrackers="bt-tracker=`awk NF /tmp/trackers_all.txt|sed ":a;N;s/\n/,/g;ta"`"
Oldtrackers="`grep bt-tracker=  /data/config/custom.conf`"
if [ -e "/tmp/trackers_all.txt" ]; then
  if [ $Newtrackers == $Oldtrackers ]; then
    echo "trackers no need update!"
  else
    sed -i 's@'"$Oldtrackers"'@'"$Newtrackers"'@g'   /data/config/custom.conf
    #kill aria2
    ps -ef | grep '/data/config/custom.conf' | grep -v grep | awk '{print $1}' | xargs kill -9
    echo "trackers updated. aria2 restarting..."
  fi
  rm /tmp/trackers_all.txt
else
  echo "download trackers file failed, please check your network!"
fi
