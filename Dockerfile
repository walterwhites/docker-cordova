FROM beevelop/cordova:latest
MAINTAINER Walter whites <hopemagie@gmail.com>
WORKDIR /opt
RUN wget -q https://services.gradle.org/distributions/gradle-4.1-all.zip
RUN chmod 775 /opt/gradle-4.1-all.zip
RUN mkdir -p /opt/gradle-4.1/wrapper/dists/
RUN unzip gradle-4.1-all.zip -d /opt/gradle-4.1/wrapper/dists/
RUN mv /opt/gradle-4.1/wrapper/dists/gradle-4.1/bin/gradle /opt/gradle-4.1/wrapper/dists/gradle-4.1/bin/gradle4
RUN chmod 775 /opt/gradle-4.1/wrapper/dists/gradle-4.1/bin/gradle4
RUN wget -q https://repo1.maven.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar \
    && unzip j2objc-annotations-1.1.jar -d /opt
ENV GRADLE_HOME /opt/gradle-4.1
ENV GRADLE_USER_HOME /opt/gradle-4.1
ENV PATH $PATH:/usr/bin
ENV ANDROID_HOME=/opt/android
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
WORKDIR /opt/android/tools/bin
RUN ./sdkmanager --update
RUN mkdir "$ANDROID_HOME/licenses"
RUN echo "d56f5187479451eabf01fb78af6dfcb131a6481e" > "$ANDROID_HOME/licenses/android-sdk-license"
RUN echo "8933bad161af4178b1185d1a37fbf41ea5269c55" >> "$ANDROID_HOME/licenses/android-sdk-license"
RUN echo "84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
RUN npm install -g @angular/cli
WORKDIR /workspace
ENV PATH $PATH:/opt/android/tools/bin
ENV PATH $PATH:/opt/gradle-4.1/wrapper/dists/gradle-4.1/bin/