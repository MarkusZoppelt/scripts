#!/bin/sh

echo 'Dieses Script benötigt root Rechte:\n'

USERS=$(sudo adquery group domain\ students -m)

sudo dscl . append /Groups/_developer GroupMembership $USERS && echo 'Added students to developer: ' $USERS
