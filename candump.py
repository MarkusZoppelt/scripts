#! /usr/local/bin/python3
from pyvit import can
from pyvit.hw.cantact import CantactDev

dev = CantactDev("/dev/cu.usbmodem1451")
dev.set_bitrate(500000)
dev.start()
while True:
      print(dev.recv())
