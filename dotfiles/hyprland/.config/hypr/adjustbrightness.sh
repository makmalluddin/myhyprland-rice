if pgrep -x "gammastep" > /dev/null
then
    # Adjust brighness to normal
    pkill -x "gammastep"
    notify-send "gammastep: off" -i display
else
    # Adjust brightness with 6500 temperature and 0.5 brighness
    gammastep -O 6500 -b 0.5 &
    notify-send "gammastep: on" -i display
fi
