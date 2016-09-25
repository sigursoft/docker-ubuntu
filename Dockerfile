FROM ubuntu:16.04
MAINTAINER Anton Kozik, pazitron@gmail.com

ENV LAST_UPDATE=2016-09-25

RUN apt-get update && \
    apt-get upgrade -y

# Set the timezone
RUN echo "Europe/Warsaw" | tee /etc/timezone && \
    ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Set the locale for UTF-8 support
RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && \
    locale-gen && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# basic tools

RUN apt-get install -y \
    curl \
    git \
    lsof \
    man \
    psmisc \
    screen \
    vim \
    wget

# admin tools

RUN apt-get install -y \
    htop

# developer tools

RUN apt-get install -y \
    openjdk-8-jdk-headless
