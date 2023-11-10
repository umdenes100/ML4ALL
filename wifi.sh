#!/bin/bash

echo "$@"

if [ $# -gt 0 ] && [ $1 = "wifi" ] ; then
	if [ $# -gt 1 ] ; then
		if [ $2 = "show" ] ; then
			# todo test
			echo "current connection: "
			iwgetid -r
			echo "wlan0 info (ip shown after inet):"
			ifconfig wlan0
			if [ $# -gt 2 ] && [ $3 = "all" ] ; then
				echo "all available connections:"
				nmcli dev wifi
			fi
			# or nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2
		elif [ $2 = "con" ] ; then
			if [ $# -gt 2 ] ; then
				#todo dont be dumb here lol
				if [ $3 = "1116" ] ; then
					sudo nmcli device wifi connect VisionSystem1116-5G || sudo nmcli device wifi connect VisionSystem1116-2.4
				elif [ $3 = "1215" ] ; then
					sudo nmcli device wifi connect VisionSystem1116-5G || sudo nmcli device wifi connect VisionSystem1215-2.4
				elif [ $3 = "down" ] ; then
					network=$(iwgetid -r)
					sudo nmcli con down ${network}\ 1 || sudo nmcli con down ${network} || echo "Error :("
				else
					echo "Invalid 3rd argument - please pass 1116 or 1215"
				fi
			else
				echo "please enter 1116 or 1215 after con"
			fi
		fi
	else 
		echo "wifi command options:"
		echo "show - display current wifi information"
		echo "con - connect to a network. Valid inputs: wifi con 1116, wifi con 1215"
	fi
	sudo python ip_display/ip_startup.py
	exit 0
fi