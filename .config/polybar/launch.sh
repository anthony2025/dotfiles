#!/bin/bash

killall -q polybar
echo "---" | tee -a /tmp/polybar.log /dev/null
polybar example >>/tmp/polybar.log 2>&1 &
