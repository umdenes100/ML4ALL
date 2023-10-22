#!/bin/bash
shopt -s extglob

IFS= read -e -r -p 'Enter your name: ' name
IFS= read -e -r -p 'Enter your section: ' sec
name=${name// /_}
sec=${sec// /_}

NVDLI_DOCKER_IMAGE_VER=v2.0.2-r32.7.1

if [[ ! -d ~/ML4ALL/mount_points/${name}_${sec}/ ]]; then
	echo "Mount point not found - creating ..."
	mkdir -p ~/ML4ALL/mount_points/${name}_${sec}/
	cp -r ~/ML4ALL/$1/* ~/ML4ALL/mount_points/${name}_${sec}/
else
	echo "Mount point already exists!"
	if [ ${SAVE} = "1" ] ; then
		cd ~/ML4ALL/mount_points/
		zip -r ~/backup_${name}_${sec}.zip ${name}_${sec}/*
		echo -e "On your personal computer, use scp to get zip file.\n Example (Windows): scp jetbot@<IP_ADDR_OF_JETSON>:/home/jetbot/file.zip C:/Users/<USER_NAME>/Desktop"
		exit 0
	elif [ ${MPUPDATE} = "1" ] ; then
		echo "UPDATE OPTION USED - IMPORTANT INFO : "
		echo "--------------------------------------"
		echo -e "It is recommended you save a copy of your code base in case this command messes something up.\n Use enes100ml save to save a zip file - then on your local machine, use scp to get file.\n Example (Windows): scp jetbot@<IP_ADDR_OF_JETSON>:/home/jetbot/file.zip C:/Users/<USER_NAME>/Desktop"
		echo "IN ADDITION!!! MAKE SURE YOU ARE USING MISSION OPTION AS WELL!!! USE enes100ml mission update"
		echo "--------------------------------------"
		read -r -p "Are you sure? [y/N] " response
		case "$response" in
			[yY][eE][sS]|[yY])
				cp ~/ML4ALL/mount_points/${name}_${sec}/ML_Live/example.py ~/ML4ALL/mount_points/${name}_${sec}/ML_Live/YOUR_OLD_example.py 
				tar -cpC ~/ML4ALL/$1 . | tar -xpC ~/ML4ALL/mount_points/${name}_${sec}
				;;
			*)
				echo "exiting update..."
				;;
		esac
		exit 0
	fi
fi

DEVICE=""
if [ $1 = "lesson_material" ]; then
	DEVICE="--device /dev/video0"
fi

echo "Starting Docker with image ${NVDLI_DOCKER_IMAGE_VER}"
echo "RECOMMENDED: Serial connection @ 192.168.55.1:8888 (password dlinano)"
sudo docker run --runtime nvidia -it --rm --network host --volume ~/ML4ALL/mount_points/${name}_${sec}/:/nvdli-nano/ ${DEVICE} nvcr.io/nvidia/dli/dli-nano-ai:${NVDLI_DOCKER_IMAGE_VER}
