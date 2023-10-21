#!/bin/bash

cd ~/ML4ALL && git config --unset core.filemode && git config --global core.filemode false

export DEV_SCRIPT_PATH=~/ML4ALL/dev_nb.sh
export STUDENT_SCRIPT_PATH=~/ML4ALL/student_nb.sh

DEV=0
GIT=1
CPFROM="lesson_material"
export MPUPDATE=0
export RESTORE=0

for i in $@
do 
	if [ $i = "list" ]; then
		ls ~/ML4ALL/mount_points/
		exit 0
	elif [ $i = "restore" ]; then
		export RESTORE=1
	elif [ $i = "dev" ]; then
		DEV=1
	elif [ $i = "nogit" ]; then
		GIT=0
	elif [ $i = "mission" ]; then
		CPFROM="mission_material"
	elif [ $i = "update" ]; then
		export MPUPDATE=1
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
