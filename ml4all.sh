#!/bin/bash

cd ~/ML4ALL && git config --unset core.filemode && git config --global core.filemode false

export DEV_SCRIPT_PATH=~/ML4ALL/dev_nb.sh
export STUDENT_SCRIPT_PATH=~/ML4ALL/student_nb.sh

DEV=0
GIT=1
CPFROM="lesson_material"
export MPUPDATE=0
export SAVE=0

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

for i in $@
do 
	if [ $i = "list" ]; then
		ls ~/ML4ALL/mount_points/
		exit 0
	elif [ $i = "save" ]; then
		export SAVE=1
		echo "note - save command will only work if mount point exists"
	elif [ $i = "dev" ]; then
		DEV=1
	elif [ $i = "nogit" ]; then
		GIT=0
	elif [ $i = "mission" ]; then
		CPFROM="mission_material"
	elif [ $i = "update" ]; then
		export MPUPDATE=1
		echo "note - update command will only work if mount point exists"
	fi
done

if [ ${GIT} = "1" ] ; then
	echo "Fetching latest from repo ..."
	cd ~/ML4ALL ; git pull || echo "git pull failed"
	echo "Done ..." ; echo ""
else
	echo "Skipping git pull" ; echo ""
fi

echo "Git hash: " ; git rev-parse HEAD ; echo ""

if [ ${DEV} = "1" ] ; then
	chmod +x ${DEV_SCRIPT_PATH}
	${DEV_SCRIPT_PATH}
else 
	chmod +x ${STUDENT_SCRIPT_PATH}
	${STUDENT_SCRIPT_PATH} ${CPFROM}
fi
