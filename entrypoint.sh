#!/bin/bash

for addr in "$@" 
do
adb connect $addr
done

if [ "`ls -A config`" = "" ];
then 
  cp /config/* config/
fi

python -m uiautomator2 init
python gui.py