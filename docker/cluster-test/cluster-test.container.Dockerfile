## DO NOT EDIT cluster-test.Dockerfile
## Edit cluster-test.Dockerfile.template instead and use ./generate.sh to generate cluster-test.Dockerfile
## Using C preprocessor to compile this template into cluster-test.Dockerfile for one-step build
## and cluster-test.container.Dockerfile for incremental build
##
## This adds some restrictions to this template file
## - To comment must use double ##, single # will be treated as pre-processor command
## -
FROM debian:buster
RUN apt-get update && apt-get install -y openssh-client
RUN mkdir /etc/cluster-test
WORKDIR /etc/cluster-test
COPY cluster_test_docker_builder_cluster_test /usr/local/bin/cluster-test
COPY terraform/validator-sets/100/mint.key /etc/cluster-test/
ENTRYPOINT ["cluster-test"]
ARG BUILD_DATE
ARG GIT_REV
ARG GIT_UPSTREAM
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$GIT_REV
LABEL vcs-upstream=$GIT_UPSTREAM
