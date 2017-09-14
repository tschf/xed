# Copyright (c) 2017 Trent Schafer
#
# Base image for install Oracle XE on
#
#
FROM ubuntu:16.04

MAINTAINER Trent Schafer <trent.schafer@gmail.com>

USER root
WORKDIR /root

ENV INSTALL_DIR="install" 

COPY install/ $INSTALL_DIR/

COPY sbin/ /sbin/

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends $(cat $INSTALL_DIR/requirements.txt) > /dev/null

RUN mkdir /var/lock/subsys


