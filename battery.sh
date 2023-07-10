
#!/bin/bash

# Retrieve battery information using upower
battery_info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

# Extract battery percentage and state
percentage=$(grep -oP 'percentage:\s+\K\d+' <<< "$battery_info")
state=$(grep -oP 'state:\s+\K\w+' <<< "$battery_info")

# Define color variables
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m' # No Color

if [[ $state == "charging" ]]; then
    echo -e "${green}\xE2\x9A\xA1$percentage%${nc}"
else
    if [[ $percentage -lt 30 ]]; then
        echo -e "${red}$percentage%${nc}"
    else
        echo -e "${green}$percentage%${nc}"
    fi
fi


