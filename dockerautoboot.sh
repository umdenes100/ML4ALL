sudo docker run --dns=192.168.1.1 --restart=always --runtime nvidia -it --network host  --volume ~/ML4ALL/:/nvdli-nano/ nvcr.io/nvidia/dli/dli-nano-ai:v2.0.2-r32.7.1
