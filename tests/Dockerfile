FROM ubuntu:latest
RUN apt update \
    && apt install -y git vim \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
RUN export TERM=xterm-256color
# RUN cd ~
# RUN git clone https://github.com/alexarmstrongvi/LexEnv.git
# RUN cd LexEnv
# RUN source install
