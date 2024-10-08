FROM --platform=i386 kalilinux/kali-last-release:i386
# Applies to kali too
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && apt-get update && apt-get -y upgrade
RUN apt -y install nano sudo \
    apt-utils vim python3 wget \
    unzip nodejs fakeroot dbus \
    base whiptail hexedit procps \
	patch wamerican ucf manpages \
	file luajit make dialog curl \
	less cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -m user && echo "user:password" | chpasswd && \
    usermod -aG sudo user
# We set WORKDIR, as this gets extracted by Webvm to be used as the cwd. This is optional.
WORKDIR /home/user/
# We set env, as this gets extracted by Webvm. This is optional.
ENV HOME="/home/user" TERM="xterm" USER="user" SHELL="/bin/bash" EDITOR="nano" LANG="en_US.UTF-8" LC_ALL="C"
RUN echo 'root:password' | chpasswd
CMD [ "/bin/bash" ]
