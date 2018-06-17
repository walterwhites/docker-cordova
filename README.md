# docker-cordova
Build your app with cordova in docker container

https://hub.docker.com/r/walterwhites/docker-cordova/

## Table of Contents

* [Build container while send it files from host](#build-container-while-send-it-files-from-host)
  * [Create a Dockerfile](#create-a-dockerfile)
  * [Build image](#build-image)
  * [Create a container](#create-a-container)

* [Or build container while share data with volumes](#or-build-container-while-share-data-with-volumes)

* [Informations](#informations)
* [Build your app](#build-your-app)


## Build container while send it files from host

## Create a Dockerfile

```
FROM beevelop/cordova:latest
MAINTAINER Walter whites <hopemagie@gmail.com>
WORKDIR /workspace
ADD /Dir_host /workspace
EXPOSE 3000
VOLUME /workspace
```

Dir_host is the path of the dir you want copy of the host to the container

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


## Or build container while share data with volumes

To build app into the docker container

1) Build image of Dockerfile (which is in source)

```
sudo docker build . -t walterwhites/cordova
```

2) Run container

```
docker run -ti --rm --name=cordova -v /Users/username/workspace/DIR_HOST_TO_COPY:/DIR_CONTAINER walterwhites/cordova
```

DIR_HOST_TO_COPY = path of the directory of your host machine you want copy to the docker container

DIR_CONTAINER = path on your docker container where you want dir being copied

option -t is to run the container with terminal
option -i is to run in interactive mode
option -rm is to stop the container when exit it
option -v is to create volume to share between your host (local machine) and the container


Note if you want keep the same container and don't delete it after exit, you should run:
```
docker run -ti --name=cordova -v /Users/username/workspace/gusto-coffee-mobile-app:/workspace walterwhites/cordova
```

After exit if is stoped you should start it:
```
docker start CONTAINER_ID
```

and to execute with bash:
```
docker exec -it <container-name/ID> bash
```

to know the container id/name you can run:
```
docker ps -a
```

Option -a is to know all container even if are stopped

## Informations: 

  - If you get error "Copying a file in a Dockerfile, no such file or directory" check this post https://stackoverflow.com/questions/32997269/copying-a-file-in-a-dockerfile-no-such-file-or-directory
  
  - If you have error "You have not accepted the license agreements of the following SDK components" when you build your app, you need to accept licenses
  
  
1) go to android tools and run .android

```
cd /opt/android/tools 
./android
```


2) update sdk:

```
cd /opt/android/tools 
android update sdk --no-ui --all --filter platform-tools,android-25,extra-android-m2repository
```

or

```
android update sdk --no-ui
```

Accept the licenses


3) update sdk manager:
```
cd /opt/android/tools/bin
./sdkmanager --update
```

Accept the licenses


## Build your app: 

To run your app with cordova in container:

1) go to your cordova project

2) add the platform if you don't already add it

```
cordova platform add android
```

3) build you app

```
cordova build android
```
