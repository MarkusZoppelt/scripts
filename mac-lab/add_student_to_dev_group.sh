#!/bin/sh

if [ -z "$1" ]; then
  echo 'Keine Text-Datei. Zu wenige Argumente'
  exit
fi

USERS=$(cat $1)

echo 'Dieses Script benötigt root Rechte:\n'

sudo dscl . append /Groups/_developer GroupMembership $USERS && echo 'Added users: ' $USERS
