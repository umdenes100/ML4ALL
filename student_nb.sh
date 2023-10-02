IFS= read -e -r -p 'Enter your name: ' name
IFS= read -e -r -p 'Enter your section: ' sec
name=${name// /_}
sec=${sec// /_}

export NVDLI_DOCKER_IMAGE_VER=v2.0.2-r32.7.1

if [[ ! -d ~/ML4ALL/mount_points/${name}_${sec}/ ]]; then
	echo "Mount point not found - creating ..."
	mkdir -p ~/ML4ALL/mount_points/${name}_${sec}/
	cp -r ~/ML4ALL/$1/* ~/ML4ALL/mount_points/${name}_${sec}
else
	echo "Mount point already exists!"
fi

echo "Starting Docker with image ${NVDLI_DOCKER_IMAGE_VER}"
echo "RECOMMENDED: Serial connection @ 192.168.55.1:8888 (password dlinano)"
sudo docker run --runtime nvidia -it --rm --network host --volume ~/ML4ALL/mount_points/${name}_${sec}/:/nvdli-nano/ --device /dev/video0 nvcr.io/nvidia/dli/dli-nano-ai:${NVDLI_DOCKER_IMAGE_VER}
