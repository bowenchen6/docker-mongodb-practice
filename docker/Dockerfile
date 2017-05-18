# 基于baseimage镜像
FROM phusion/baseimage
MAINTAINER Bowen <bowenchen886@gmail.com>

# 设置正确的环境变量
ENV HOME /root

# 设置mongodb版本环境变量
ENV MONGO_MAJOR 3.4
ENV MONGO_VERSION 3.4.4
ENV MONGO_PACKAGE mongodb-org

# 初始化baseimage-docker系统
CMD ["/sbin/my_init"]

# 修改镜像源，安装mongodb
RUN set -x \
    && sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 \
    && echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/${MONGO_MAJOR} multiverse" > /etc/apt/sources.list.d/mongodb-org-${MONGO_MAJOR}.list \
    && apt-get update \
    && apt-get install -y \
        ${MONGO_PACKAGE}=$MONGO_VERSION \
        ${MONGO_PACKAGE}-server=$MONGO_VERSION \
        ${MONGO_PACKAGE}-shell=$MONGO_VERSION \
        ${MONGO_PACKAGE}-mongos=$MONGO_VERSION \
        ${MONGO_PACKAGE}-tools=$MONGO_VERSION \
    && rm -rf /var/lib/mongodb \
    && /bd_build/cleanup.sh

# 添加mongodb后台运行进程
RUN mkdir -p /data/db \
    && chown -R mongodb:mongodb /data/db \
    && mkdir /etc/service/mongodb
COPY mongodb.sh /etc/service/mongodb/run

# 暴露27017端口
EXPOSE 27017