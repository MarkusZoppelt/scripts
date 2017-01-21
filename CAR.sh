#!/bin/sh
sudo rfcomm connect rfcomm0 00:11:02:28:61:00 &
# sudo rfcomm connect rfcomm0 12:34:56:78:A1:AF &
ping localhost -c 10
cd /home/pi/car
sudo python obd_gui.py
