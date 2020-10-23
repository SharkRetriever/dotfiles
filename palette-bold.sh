#!/bin/bash

# Thanks to https://unix.stackexchange.com/a/124409 for the following snippet

color=16;

while [ $color -lt 245 ]; do
    echo -e "$color: \\033[1;38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
    ((color++));
done  

