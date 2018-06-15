#!/bin/sh

encrypted=$1

gpg -d $1 > decrypted.txt
munpack decrypted.txt & 
open . & 
less decrypted.txt


