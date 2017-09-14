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

COPY requirements.txt $INSTALL_DIR/

COPY sbin/ /sbin/

RUN apt-get update -qq && \
    apt-get install -y -qq --no-install-recommends $(cat $INSTALL_DIR/requirements.txt)

RUN mkdir /var/lock/subsys


