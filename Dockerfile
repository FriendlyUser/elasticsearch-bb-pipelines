FROM docker.elastic.co/elasticsearch/elasticsearch:7.5.1

MAINTAINER David Li <davidli012345@gmail.com>

ENV discovery.type="single-node"

ENV http.port=9250

EXPOSE 9250/tcp
