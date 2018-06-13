# docker-cordova
Build your app with cordova in docker container

## Table of Contents

* [Create a Dockerfile](#create-a-dockerfile)
* [Build image](#build-image)
* [Create a container](#create-a-container)
* [Informations](#informations)
* [Build your app](#build-your-app)

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

  - If you get error "Copying a file in a Dockerfile, no such file or directory" check this post https://stackoverflow.com/questions/32997269/copying-a-file-in-a-dockerfile-no-such-file-or-directory
  
  - If you have error "You have not accepted the license agreements of the following SDK components" when you build your app, you need to accept licenses
  
  
1) go to android tools and run .android

```
cd /opt/android/tools 
./android
```


2) update sdk:

```
android update sdk --no-ui --all --filter platform-tools,android-25,extra-android-m2repository
```

Accept the licenses


3) update sdk manager:
```
sdkmanager --update
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

