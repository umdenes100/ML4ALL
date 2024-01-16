sudo docker run --entrypoint /nvdli-nano/Spr24comms/startup.sh --dns=192.168.1.1 --runtime nvidia -it --network host  --volume ~/ML4ALL/:/nvdli-nano/ nvcr.io/nvidia/dli/dli-nano-ai:v2.0.2-r32.7.1
