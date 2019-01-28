ARG CUDA_VERSION=9.0-cudnn7

FROM nvidia/cuda:${CUDA_VERSION}-runtime-ubuntu16.04

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

#
# Install Miniconda in /opt/conda
#
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget bzip2 ca-certificates \
        libglib2.0-0 libxext6 libsm6 libxrender1 \
        git mercurial subversion libbz2-dev libz-dev libpng-dev make && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

ENV PYTHON_VERSION 3.6.8

RUN conda install -y python==${PYTHON_VERSION}

CMD ["python3"]
