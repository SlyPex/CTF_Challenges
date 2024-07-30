FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server less && \
    rm -r /var/lib/apt/lists/*

RUN useradd -m -d /challenge tawat
COPY challenge/ /challenge
RUN chown -R root:tawat /challenge && \
    mv /challenge/shell /usr/bin/ && \ 
    chsh -s /usr/bin/shell tawat && \
    echo 'tawat:ctf' | chpasswd && \
    rm -r /etc/update-motd.d/ && \
    ln -s /dev/null .bash_history

WORKDIR /challenge

EXPOSE 22

ENTRYPOINT service ssh start && tail -f /dev/null
