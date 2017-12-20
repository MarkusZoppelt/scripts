#!/bin/sh

sudo slcand -o -c -s6 /dev/ttyACM*
sudo ip link set up slcan0 && echo "Interface is up!"
ifconfig slcan0
