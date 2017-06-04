#!/bin/sh

videofile=$1
mkdir giffy
ffmpeg -i $videofile -t 30 giffy/%04d.png
convert giffy/%04d.png -delay 3 $videofile giffy.gif
rm -rf giffy/
