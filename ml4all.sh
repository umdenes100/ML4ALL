#!/bin/bash

echo "Enter your name":
read name
echo "Enter your section":
read sec

mkdir -p ~/ML4ALL/mount_points/${name}_${sec}/ && cp -r ~/ML4ALL/lesson_material/* ~/ML4ALL/mount_points/${name}_${sec}
echo "Starting Docker with image v2.0.2-r32.7.1"
sudo docker run --runtime nvidia -it --rm --network host --volume ~/ML4ALL/mount_points/${name}_${sec}/:/nvdli-nano/ --device /dev/video0 nvcr.io/nvidia/dli/dli-nano-ai:v2.0.2-r32.7.1
