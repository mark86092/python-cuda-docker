build:
	docker build -t mark86092/python:3.6-cuda9.0-cudnn7 --build-arg CUDA_VERSION=9.0-cudnn7 .
	docker build -t mark86092/python:3.6-cuda10.0-cudnn7 --build-arg CUDA_VERSION=10.0-cudnn7 .
