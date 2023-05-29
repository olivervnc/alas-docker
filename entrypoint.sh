#!/bin/bash

for addr in "$@" 
do
  if [[ "`adb connect $addr`" = *"connected"* ]];
  then 
    # echo "connected"
  else
    echo "failed to connect to $addr"
    exit 1
  fi
done

if [ "`ls -A config`" = "" ];
then 
  cp /config/* config/
fi

python -m uiautomator2 init
python gui.py