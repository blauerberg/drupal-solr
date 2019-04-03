FROM ubuntu:bionic
MAINTAINER Yoshikazu Aoyama <yskz.aoyama@gmail.com>

ENV SOLR_VERSION 4.10.4

RUN apt-get update -y
RUN apt-get install -y openjdk-11-jre-headless tar curl
RUN apt-get clean

RUN mkdir -p /opt
RUN cd /opt && curl http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz /opt/solr-$SOLR_VERSION.tgz | tar zx --strip-components 1 --one-top-level=solr

RUN curl https://ftp.drupal.org/files/projects/apachesolr-7.x-1.11.tar.gz | tar zx -C /opt/solr/example/solr/collection1/conf --strip-components 3

WORKDIR /opt/solr/example
EXPOSE 8983

CMD java -Xmx256m -jar start.jar
