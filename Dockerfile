FROM ubuntu:14.04
MAINTAINER Riliumph <https://github.com/Riliumph/Dockerfile_template>

##### Avoidance method of apt-get error
### Disable interactive interface for installer
ENV DEBIAN_FRONTEND noninteractive
### Force initctl true
RUN dpkg-divert --local --rename --add /sbin/initctl && rm -f /sbin/initctl && ln -s /bin/true /sbin/initctl
### Enable multi architecture for 32bit software(ex:i386)
RUN dpkg --add-architecture i386
### Speed up by changing the apt-get reference destination
RUN sed -i.us -e 's/\/\/archive.ubuntu.com/\/\/ftp.jaist.ac.jp/g'  /etc/apt/sources.list

