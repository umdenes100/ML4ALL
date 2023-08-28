#!/bin/bash

IFS= read -r -p 'Enter your name: ' name
IFS= read -r -p 'Enter your section: ' sec

name=${name// /_}
sec=${sec// /_}

if [[ ! -d ~/ML4ALL/mount_points/${name}_${sec}/ ]]; then
	echo "Mount point not found - creating ..."
	mkdir -p ~/ML4ALL/mount_points/${name}_${sec}/
	cp -r ~/ML4ALL/lesson_material/* ~/ML4ALL/mount_points/${name}_${sec}
else
	echo "Mount point already exists!"
fi

echo "Starting Docker with image v2.0.2-r32.7.1"
echo "RECOMMENDED: Serial connection @ 192.168.55.1:8888"
sudo docker run --runtime nvidia -it --rm --network host --volume ~/ML4ALL/mount_points/${name}_${sec}/:/nvdli-nano/ --device /dev/video0 nvcr.io/nvidia/dli/dli-nano-ai:v2.0.2-r32.7.1
