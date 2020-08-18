#!/usr/bin/env bash

polybar-msg cmd quit
echo "---" | tee -a /tmp/polybar.log /dev/null
polybar example >>/tmp/polybar.log 2>&1 &
echo "Bar launched..."
