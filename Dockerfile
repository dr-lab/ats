FROM ubuntu:latest

MAINTAINER Huaping Gu <humphrey.gu@gmail.com>

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN wget http://mirror.metrocast.net/apache/trafficserver/trafficserver-5.2.0.tar.bz2

RUN tar -xvf trafficserver-5.2.0.tar.bz2

RUN sudo apt-get build-dep -y trafficserver

RUN sudo apt-get install -y libhwloc-dev libhwloc5 libunwind8 libunwind8-dev

RUN cd /trafficserver-5.2.0

RUN autoreconf -if /trafficserver-5.2.0/configure.ac

RUN /trafficserver-5.2.0/configure --enable-experimental-plugins --prefix=/opt/ats

RUN make

RUN make check

RUN sudo make install

RUN /opt/ats/bin/trafficserver start

EXPOSE 8080 

