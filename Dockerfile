#This Dockerfile uses the ubuntu image
#Author: Rokas_Urbelis
#Email : Rokas.Yang@gmail.com
#Blog  : https://blog.linux-code.com
FROM ubuntu:bionic
MAINTAINER RokasUrbelis(Based on github deepin-wine-ubuntu project)

ARG IM=ibus

ADD deepin-wine-ubuntu /root/deepin-wine-ubuntu
COPY link.sh /root/
COPY deb/ /root/deepin-wine-ubuntu/
COPY sources.list /etc/apt/

ENV LC_ALL=zh_CN.UTF-8 \
    XIM=$IM \
    GTK_IM_MODULE=$IM \
    QT_IM_MODULE=$IM \
    XMODIFIERS="@im=$IM" \
    TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=non-interactive

RUN apt-get update \
    && apt-get install wget git locales ttf-wqy-zenhei sudo tzdata -y \
    && locale-gen en_US.UTF-8 zh_CN.UTF-8 zh_CN.GBK \
    && update-locale LC_ALL=zh_CN.UTF-8 \
    && yes|bash /root/deepin-wine-ubuntu/install.sh \
    && /bin/bash /root/link.sh \
    && rm -f /root/link.sh \
    && rm -rf /root/deepin-wine-ubuntu \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apt-get clean && apt-get autoclean \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* 
WORKDIR /root

CMD ["/bin/bash"]
