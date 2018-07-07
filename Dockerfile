FROM ubuntu:18.04

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

RUN groupadd -g 1000 june
RUN useradd -u 1000 -g 1000 -m -s /usr/bin/zsh june
RUN usermod -aG sudo june
RUN echo "june ALL=NOPASSWD: ALL" >> /etc/sudoers
USER june
WORKDIR /home/june

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/sindresorhus/pure .zsh-pure

COPY . /home/june

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vi +PluginInstall +qall

RUN pip3 install setuptools
RUN pip3 install pylint pyflakes

ENV TERM xterm-256color
ENV SHELL zsh
WORKDIR /home/june/workspace
ENTRYPOINT sh
