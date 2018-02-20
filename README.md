docker-teeworlds
================

Docker image for running the [Teeworlds](https://www.teeworlds.com) server

A fork of https://github.com/virtualroot/docker-teeworlds.

To run locally, type:

```bash
docker build -t dgkanatsios/docker-teeworlds .
docker run --rm -it -p 8303:8303/udp --name teeworlds1 dgkanatsios/docker-teeworlds
```
