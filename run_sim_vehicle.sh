#!/bin/bash

open_terminal() {
    local command=$1

    if command -v gnome-terminal &>/dev/null; then
        gnome-terminal -- bash -c "$command; exec bash"
    elif command -v xterm &>/dev/null; then
        xterm -hold -e "$command"
    elif command -v konsole &>/dev/null; then
        konsole --noclose -e "$command"
    elif command -v xfce4-terminal &>/dev/null; then
        xfce4-terminal --hold -e "$command"
    elif command -v mate-terminal &>/dev/null; then
        mate-terminal -- bash -c "$command; exec bash"
    else
        echo "No supported terminal emulator found."
        exit 1
    fi
}

open_terminal "sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON -I0"

open_terminal "sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON -I1"

open_terminal "sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON -I2"

open_terminal "sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON -I3"

open_terminal "sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON -I4"

echo "Commands launched in separate terminals."
