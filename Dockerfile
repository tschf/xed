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
ENV USER root

ENV INSTALL_DIR="install" \
    PATH="$HOME/go/bin:$PATH" \
    GOPATH="$HOME/go" \
    ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe \
    ORACLE_SID=XE

ENV PATH="$ORACLE_HOME/bin:$PATH"

COPY install/ $INSTALL_DIR/

COPY sbin/ /sbin/

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends $(cat $INSTALL_DIR/requirements.txt) > /dev/null

RUN mkdir /var/lock/subsys && \
    mkdir $HOME/go && \
    ln -s /usr/bin/awk /bin/awk

RUN go get github.com/tschf/odl
