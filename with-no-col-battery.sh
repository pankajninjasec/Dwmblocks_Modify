
#!/bin/bash

battery_info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

percentage=$(echo "$battery_info" | grep -oE 'percentage:[[:space:]]+[0-9]+' | awk '{print $2}')
state=$(echo "$battery_info" | grep -oE 'state:[[:space:]]+\w+' | awk '{print $2}')

if [ "$state" = "charging" ]; then
    echo "⚡$percentage%"
else
    if [ "$percentage" -lt 30 ]; then
        echo "$percentage%"
    else
        echo "$percentage%"
    fi
fi
