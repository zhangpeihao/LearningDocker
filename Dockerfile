FROM centos:centos6
MAINTAINER Zhang Peihao "zhangpeihao@gmail.com"

# Update repo mirror
RUN curl -L -o CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
    && mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak \
    && mv ./CentOS-Base.repo /etc/yum.repos.d/ 
	
# install gcc
RUN yum install -y gcc tar \
    yum clean all

# install go
RUN curl -L https://github.com/zhangpeihao/LearningDocker/raw/master/downloads/go1.3.1.linux-amd64.tar.gz | tar xvz -C /usr/local \
    && cd /usr/local/go/src \
    && ./make.bash

VOLUME ["/usr/local/src/go"]

ENV GOROOT /usr/local/go
ENV GOPATH /usr/local/src/go
ENV PATH $GOROOT/bin:$PATH
