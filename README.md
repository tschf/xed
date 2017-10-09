# XEd

Welcome to XEd. This is the source for a Docker image I'm working on to be a starting point for setting up an Oracle XE instance.

## Usage:

Create a Dockerfile like so:

```
FROM tschf/xed

MAINTAINER x

ENV OTN_USERNAME=x@gmail.com \
    OTN_PASSWORD=passowrd \
    OTN_ACCEPT_LICENSE=Y \
    ORACLE_BASE=/u01/app/oracle \
    ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe \
    ORACLE_SID=XE

ENV PATH="$ORACLE_HOME/bin:$PATH"

RUN cd install && \
    ./downloadXe.sh && \
    ./installXe.sh oracle-xe-11.2.0-1.0.x86_64.rpm.zip

EXPOSE 1521

CMD exec $ORACLE_BASE/runXe.sh
```

Then build and run. The initial build will probably take a few minutes as it downloads installation media. But once you have the image, you have access to a readily available Oracle 11g XE db instance.

## Docker cheat sheet

```bash
docker build -t tschf/xed  
docker run --shm-size=2g -it tschf/xed

# Removing, per: https://stackoverflow.com/questions/21398087/how-can-i-delete-dockers-images
# Containers
docker rm $(docker ps -a -q)
# Images
docker rmi $(docker images -q)
# Stop running containers
docker stop $(docker ps -q -a)
# Delete images with no tag/name
docker rmi $(docker images -f "dangling=true" -q)
```

# License

The Unlicense

# Author

Trent Schafer
