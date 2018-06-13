FROM beevelop/cordova:latest
MAINTAINER Walter whites <hopemagie@gmail.com>
WORKDIR /workspace
ADD /gusto-coffee-mobile-app /workspace
EXPOSE 3000
VOLUME /workspace
