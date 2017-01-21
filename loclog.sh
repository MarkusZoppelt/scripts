#!/bin/sh

echo `date` `curl -s ifconfig.me/ip` | ssh mzoppelt@zoppelt.net 'cat >> ~/loc/ip.log'
