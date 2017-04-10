#!/bin/sh

curl --silent "http://www.werkswelt.de/?id=hohf" | grep Speiseplan > food.html
textutil -convert txt food.html
cat food.txt
rm food.html food.txt
