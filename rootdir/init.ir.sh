#!/vendor/bin/sh

if [ -e /sys/class/leds/infrared/transmit ]; then
	setprop ro.ir led
else
	setprop ro.ir spidev
fi
