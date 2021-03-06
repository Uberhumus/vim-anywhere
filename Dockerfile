FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Jerusalem
ARG USERNAME=yotam
RUN apt-get update; \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get install -y vim tmux bash-completion shellcheck ssh git pylint flake8 python sudo expect curl cmake build-essential python3-dev golang npm openjdk-11-jre exuberant-ctags python3-pip && \
    useradd -m -s /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \ 
    echo vim-anywhere > /etc/hostname

WORKDIR /home/$USERNAME
COPY .vimrc .
RUN mkdir -p ./.vim/pack/plugins/start 
WORKDIR /home/$USERNAME/.vim/pack/plugins/start
RUN git clone https://github.com/tpope/vim-fugitive.git/ && \
    git clone --depth 1 https://github.com/dense-analysis/ale.git && \
    git clone https://github.com/ycm-core/YouCompleteMe.git
WORKDIR /home/$USERNAME/.vim/pack/plugins/start/YouCompleteMe
RUN git submodule update --init --recursive && \
    python3 install.py --all && \
    chown -R $USERNAME:$USERNAME /home/$USERNAME && \
    PASSWORD=$(openssl rand -base64 16 | tr -d "=") && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    echo $PASSWORD
WORKDIR /home/$USERNAME
COPY requirements.txt .
RUN pip3 install -r /home/$USERNAME/requirements.txt
USER $USERNAME
