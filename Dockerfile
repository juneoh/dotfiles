FROM ubuntu:18.04

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

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /home/june/.conda && \
     rm ~/miniconda.sh
ENV PATH /home/june/.conda/bin:$PATH
RUN conda install -y -c pytorch cython pytorch-cpu torchvision && \
    conda clean -ya

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/sindresorhus/pure .zsh-pure

COPY . /home/june

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vi +PluginInstall +qall

RUN pip install setuptools
RUN pip install pylint pyflakes
RUN pip install pandas

USER root
RUN echo "export PATH=/home/june/.conda/bin:\$PATH" > /etc/profile.d/conda.sh
RUN echo "export PATH=/usr/local/nvidia/bin:\$PATH" > /etc/profile.d/nvidia.sh

USER june
ENV TERM xterm-256color
ENV SHELL zsh
WORKDIR /home/june/workspace
