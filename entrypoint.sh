#!/bin/bash

for addr in "$@" 
do
adb connect $addr
done

python -m uiautomator2 init
python gui.py