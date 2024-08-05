FROM ubuntu:22.04

RUN apt update && \
    apt install -y openssh-server python3 vim sudo && \
    rm -r /var/lib/apt/lists/*

RUN useradd -m -d /home/tawat-cracked tawat-cracked && \
    useradd -m -d /home/tawat tawat && \
    usermod -aG tawat tawat-cracked && \
    usermod -aG tawat-cracked tawat

WORKDIR /home/tawat/
COPY challenge/ .

RUN chgrp root /home/tawat-cracked/ && \
    mv shell /usr/bin/shell && \
    chsh -s /usr/bin/shell tawat && \
    chown root:root sudoers && \
    chmod 640 sudoers flag.txt && \
    chmod 644 hash.py && \ 
    mv sudoers /etc/sudoers && \
    chown tawat-cracked:root flag.txt && \
    mv flag.txt /home/tawat-cracked/ && \
    chown -R root:tawat-cracked ./* && \
    echo 'tawat:ctf' | chpasswd && \
    sh ./setup.sh && rm ./setup.sh && \
    rm -r /etc/update-motd.d/ && \ 
    ln -s /dev/null .bash_history

EXPOSE 22

ENTRYPOINT service ssh start && tail -f /dev/null
