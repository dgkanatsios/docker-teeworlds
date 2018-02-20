[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](LICENSE)
[![unofficial Google Analytics for GitHub](https://gaforgithub.azurewebsites.net/api?repo=docker-teeworlds)](https://github.com/dgkanatsios/gaforgithub)
![](https://img.shields.io/badge/status-stable-green.svg)

docker-teeworlds
================

Docker image for running the [Teeworlds](https://www.teeworlds.com) server. You can find it on Docker Hub [here](https://hub.docker.com/r/dgkanatsios/docker-teeworlds/).

A fork of https://github.com/virtualroot/docker-teeworlds that works with [AzureContainersInstancesManagement](https://github.com/dgkanatsios/AzureContainerInstancesManagement) project by extending it with:

- ability to set server name via env variable ($SERVER_NAME)
- stores connected users count to /tmp/connected
- posts updates about connected users count to Azure Function (url is $SET_SESSIONS_URL, set during container creation from the AzureContainerInstancesManagement project).

To run locally, type:

```bash
docker build -t dgkanatsios/docker-teeworlds .
docker run --rm -it -p 8303:8303/udp -e SET_SESSIONS_URL=https://teeworlds.azurewebsites.net/api/ACISetSessions?code=<KEY> -e RESOURCE_GROUP='teeworlds' -e CONTAINER_GROUP_NAME='teeserver1' --name teeworlds1 dgkanatsios/docker-teeworlds
```