FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        zsh \
        build-essential \
        cmake \
        git \
        curl \
        wget \
        vim \
        tmux \
        ssh \
        ca-certificates \
        python3-pip \
        nodejs \
        npm

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/sindresorhus/pure .zsh-pure && \
    cd .zsh-pure && \
    ln -s "$PWD/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup && \
    ln -s "$PWD/async.zsh" /usr/local/share/zsh/site-functions/async

COPY . /root
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vi +PluginInstall +qall

RUN npm install -g eslint
RUN npm install -g babel-eslint eslint-plugin-react
RUN pip3 install -U pip setuptools
RUN pip3 install pylint pyflakes

RUN mkdir /workspace

ENV TERM xterm-256color
ENV SHELL zsh
WORKDIR /workspace
ENTRYPOINT /usr/bin/zsh
