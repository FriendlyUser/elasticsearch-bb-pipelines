# elasticsearch-bb-pipelines
Inspired by https://github.com/X1ting/elasticsearch-bitbucket-pipelines with an updated version of elasticsearch

Elasticsearch image for Bitbucket Pipelines
Bitbucket pipelines does not allow you to use dot notation in variables. So I created my own elastic search docker image to include the discovery type.

## Version
Elasticsearch 7.5.1

##Hub
https://hub.docker.com/repository/docker/grandfleet/elasticsearch-bb-pipelines

Example
```yaml
image: python:3.8.1
definitions:
  steps:
    - step: &run-tests
        name: Run tests
        script:
          - sleep 30 # Waiting elasticsearch. In your real pipeline you can not use it.
          - curl -XGET localhost:9250/_cat/health
          - python -m unititest # would be different for other programming languages
        services:
          - elasticsearch
  services:
    elasticsearch:
      image: xiting/elasticsearch-bitbucket-pipeline
      variables:
        ES_JAVA_OPTS: '-Xms512m -Xmx512m'
    docker:
      memory: 2048

pipelines:
  pull-requests:
    '**':
      - step: *run-tests
```
