#!/bin/bash

export DEV_SCRIPT_PATH=~/ML4ALL/dev_nb.sh
export STUDENT_SCRIPT_PATH=~/ML4ALL/student_nb.sh

if [ -z "$1" ] ; then
	echo "STUDENT!!!"
	GIT_PULL_EN=1
	DEV_NB=0
elif [ $1 = "dev" ] ; then
	echo "DEV!!!"
	DEV_NB=1
	if [ -z "$2" ] ; then
		echo "dev wit git :))"
		GIT_PULL_EN=1
	elif [ $2 = "nogit" ] ; then
		echo "dev wit NO  git :(())"
		GIT_PULL_EN=0
	fi
elif [ $1 = "nogit" ] ; then
	echo "no git student"
	GIT_PULL_EN=0
fi

if [ ${GIT_PULL_EN} = "1" ] ; then
	echo "Fetching latest from repo ..."
	cd ~/ML4ALL ; git pull || echo "git pull failed"
	echo "Done ..." ; echo ""
else
	echo "Skipping git pull" ; echo ""
fi

if [ ${DEV_NB} = "1" ] ; then
	echo "DEV SCRIPT!!!"
	chmod +x ${DEV_SCRIPT_PATH}
	${DEV_SCRIPT_PATH}
else 
	echo "STUDENT SCRIPT!!!"
	chmod +x ${STUDENT_SCRIPT_PATH}
	${STUDENT_SCRIPT_PATH}
fi
