#!/bin/sh

sudo slcand -o -c -s6 /dev/ttyACM* can0 && echo "Interface can0 added..."
sudo ifconfig can0 up && echo "can0 is up!"
ifconfig can0
