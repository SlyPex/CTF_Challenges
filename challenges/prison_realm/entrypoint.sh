#!/bin/sh
CHROOT_DIR="/home/alpha/prison_realm"
EXEC="chroot --userspec=0\:0 $CHROOT_DIR /bin/sh"
PORT=1337
socat -v -dd -T300 tcp-l:$PORT,reuseaddr,fork,keepalive,ignoreeof exec:"$EXEC",stderr 
