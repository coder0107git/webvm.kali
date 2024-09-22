FROM --platform=i386 kalilinux/kali-last-release:i386
# Applies to kali too
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && apt-get update && apt-get -y upgrade
RUN apt -y install nano \
    kali-tools-social-engineering
RUN useradd -m user && echo "user:password" | chpasswd
# We set WORKDIR, as this gets extracted by Webvm to be used as the cwd. This is optional.
WORKDIR /home/user/
# We set env, as this gets extracted by Webvm. This is optional.
ENV HOME="/home/user" TERM="xterm" USER="user" SHELL="/bin/bash" EDITOR="nano" LANG="en_US.UTF-8" LC_ALL="C"
RUN echo 'root:password' | chpasswd
CMD [ "/bin/bash" ]
