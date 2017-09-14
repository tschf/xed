# Copyright (c) 2017 Trent Schafer
#
# Base image for install Oracle XE on
#
#
FROM ubuntu:16.04

MAINTAINER Trent Schafer <trent.schafer@gmail.com>

# Set the user to run everything from. Since we set up the golang directory to
# be $HOME/go, we need to set an environment variables to the users home, since
# $HOME seems to come back as `/`. 
USER root
WORKDIR /root
ENV HOME /root


ENV INSTALL_DIR="install" \
    PATH="$HOME/go/bin:$PATH" \
    GOPATH="$HOME/go"

COPY install/ $INSTALL_DIR/

COPY sbin/ /sbin/

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends $(cat $INSTALL_DIR/requirements.txt) > /dev/null

RUN mkdir /var/lock/subsys && \
    mkdir $HOME/go

RUN go get github.com/tschf/odl
