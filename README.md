# XEd

Welcome to XEd. This is the source for a Docker image I'm working on to be a starting point for setting up an Oracle XE instance. 

## Docker cheat sheet

```bash
docker build -t tschf/xed  
docker run --shm-size=2g -it tschf/xed

# Removing, per: https://stackoverflow.com/questions/21398087/how-can-i-delete-dockers-images
# Containers
docker rm $(docker ps -a -q)
# Images
docker rmi $(docker images -q)
```

# License

The Unlicense

# Author

Trent Schafer


