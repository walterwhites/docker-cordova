# docker-cordova
Build your app with cordova in docker container

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

Dockerfile:

```
FROM beevelop/cordova:latest
MAINTAINER Walter whites <hopemagie@gmail.com>
WORKDIR /workspace
```

Run:

```
sudo docker build . -t walterwhites/cordova
```

then:

```
docker run --name=cordova -v /Users/username/workspace/your_host_dir:/workspace walterwhites/cordova
```

and:

```
docker run -ti cordova
```

(option -t is to get terminal in container, option -i to interact with this one)



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

