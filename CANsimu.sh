#!/bin/sh

tmux new-session -s CAN -n 'simu' -d
tmux send-keys -t CAN:simu.0 'ip link add dev vcan0 type vcan ; ip link set vcan0 up ; candump -c -a -e vcan0' C-j
tmux split-window -h
tmux split-window -v
tmux send-keys -t 1 'cangen vcan0' C-j
tmux attach -t CAN
