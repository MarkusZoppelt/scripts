#!/bin/sh

if [ -z "$1" ]; then
  echo 'Zu wenige Argumente'
  exit
fi

USER=$1

echo 'Dieses Script benötigt root Rechte:\n'

sudo dscl . append /Groups/_developer GroupMembership $USER && echo 'Added user: ' $USER
