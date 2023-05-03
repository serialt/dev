FROM debian:11

LABEL mantainer="serialt <tserialt@gmail.com> build a vm image"

#set timezone
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

# change apt source
RUN sed -i 's/\w*.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# update package
RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-transport-https ca-certificates gnupg-agent tzdata curl vim openjdk-17-jdk && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ >/etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata && \
    rm -rf /var/lib/apt/lists/*

# # change apt source to https
RUN sed -i "s@http://mirrors.ustc.edu.cn@https://mirrors.ustc.edu.cn@g" /etc/apt/sources.list