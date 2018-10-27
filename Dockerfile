FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates apt-transport-https gnupg curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list
ENV CUDA_VERSION 9.0.176
ENV CUDA_PKG_VERSION 9-0=$CUDA_VERSION-1
RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-cudart-$CUDA_PKG_VERSION && \
    ln -s cuda-9.0 /usr/local/cuda && \
    rm -rf /var/lib/apt/lists/*
# nvidia-docker 1.0
LABEL com.nvidia.volumes.needed="nvidia_driver"
LABEL com.nvidia.cuda.version="${CUDA_VERSION}"
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=9.0"

ENV NCCL_VERSION 2.3.5
RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-libraries-$CUDA_PKG_VERSION \
        cuda-cublas-9-0=9.0.176.4-1 \
        libnccl2=$NCCL_VERSION-2+cuda9.0 && \
    apt-mark hold libnccl2 && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-libraries-dev-$CUDA_PKG_VERSION \
        cuda-nvml-dev-$CUDA_PKG_VERSION \
        cuda-minimal-build-$CUDA_PKG_VERSION \
        cuda-command-line-tools-$CUDA_PKG_VERSION \
        cuda-core-9-0=9.0.176.3-1 \
        cuda-cublas-dev-9-0=9.0.176.4-1 \
        libnccl-dev=$NCCL_VERSION-2+cuda9.0 && \
    rm -rf /var/lib/apt/lists/*
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs

ENV CUDNN_VERSION 7.1.2.21
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"
RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn7=$CUDNN_VERSION-1+cuda9.1 \
            libcudnn7-dev=$CUDNN_VERSION-1+cuda9.1 && \
    apt-mark hold libcudnn7 && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo "XKBMODEL=\"pc105\"\n \
          XKBLAYOUT=\"us\"\n \
          XKBVARIANT=\"\"\n \
          XKBOPTIONS=\"\"" > /etc/default/keyboard

RUN apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        less \
        zsh \
        build-essential \
        cmake \
        libltdl7 \
        libltdl-dev \
        git \
        curl \
        tzdata \
        locales \
        wget \
        vim \
        tmux \
        ssh \
        ca-certificates \
        python3-pip \
        python3-dev \
        nodejs \
        npm && \
        rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"

RUN groupadd -g 1000 june
RUN useradd -u 1000 -g 1000 -m -s /usr/bin/zsh june
RUN usermod -aG sudo june
RUN echo "june ALL=NOPASSWD: ALL" >> /etc/sudoers
USER june
WORKDIR /home/june
RUN mkdir projects

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /home/june/.conda && \
     rm ~/miniconda.sh
ENV PATH /home/june/.conda/bin:$PATH
RUN conda install -y -c pytorch python=3.6 cython pytorch torchvision && \
    conda clean -ya

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/sindresorhus/pure .zsh-pure

COPY . /home/june
RUN sudo chown -R june:june /home/june/

RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/june/.vim/bundle/Vundle.vim
RUN vi +PluginInstall +qall

RUN pip install setuptools
RUN pip install ipython pylint flake8 pandas

USER root
RUN echo "export PATH=/home/june/.conda/bin:\$PATH" > /etc/profile.d/conda.sh
RUN echo "export PATH=/usr/local/nvidia/bin:\$PATH" > /etc/profile.d/nvidia.sh

USER june
ENV TERM xterm-256color
ENV SHELL zsh
WORKDIR /home/june/projects/
