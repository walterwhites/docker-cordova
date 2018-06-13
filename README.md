# docker-cordova
Build your app with cordova in docker container

## Table of Contents

* [Create a Dockerfile](#create-a-dockerfile)
* [Build image](#build-image)
* [Create a container](#create-a-container)
* [Informations](#informations)

## Create a Dockerfile

```
FROM beevelop/cordova:latest
MAINTAINER Walter whites <hopemagie@gmail.com>
WORKDIR /workspace
ADD /gusto-coffee-mobile-app /workspace
EXPOSE 3000
VOLUME /workspace
```

## Build image

You need to build image

```
sudo docker build . -t walterwhites/cordova -f container_cordova/docker-cordova/Dockerfile
```

Notes:
  - option -t specify your image name
  - option -f specify the path of your Dockerfile


## Create a container

Create and run new container based on the image (we delete it after exit)

```
docker run -ti --rm walterwhites/cordova bash
```


## Informations: 

If you get error "Copying a file in a Dockerfile, no such file or directory" check this post https://stackoverflow.com/questions/32997269/copying-a-file-in-a-dockerfile-no-such-file-or-directory
