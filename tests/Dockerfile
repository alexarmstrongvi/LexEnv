FROM ubuntu:latest
RUN apt update
RUN apt install -y \
    curl \
    git \
    vim \
    tmux
# RUN apt update && apt upgrade
RUN apt clean && rm -rf /var/lib/apt/lists/*
ENV TERM xterm-256color
# CMD ["/usr/bin/bash"]
# RUN cd ~
# RUN git clone https://github.com/alexarmstrongvi/LexEnv.git
# RUN cd LexEnv
# RUN source install
