#!/bin/sh

APPNAME="waybar"
PROCESSNAME=".waybar-wrapped"

if pgrep -x "$PROCESSNAME" > /dev/null; then
  pkill -x "$PROCESSNAME" 
else 
  "$APPNAME" &
fi
