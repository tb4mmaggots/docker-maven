FROM java:8-jre-alpine

MAINTAINER Riaan Stegmann(tb4mmaggots)

RUN wget http://apache.saix.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O /tmp/maven.tar.gz \
    && tar xfz /tmp/maven.tar.gz -C /usr/local/ \
    && mv $(find /usr/local -maxdepth 1 -name *maven*) /usr/local/maven3

ENV MAVEN_HOME=/usr/local/maven3
ENV PATH=$PATH:$MAVEN_HOME/bin

VOLUME /build

WORKDIR /build

#Cleanup
RUN rm -rf /tmp/*.tar.gz

#ENTRYPOINT mvn
