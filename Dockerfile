FROM alpine:latest

LABEL maintainer="yourname@example.com"

# 安装必要组件
RUN apk add --no-cache curl unzip bash

# 安装 xray-core（233boy 脚本本质上会安装官方 xray）
RUN mkdir -p /usr/local/bin \
    && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /tmp/xray \
    && mv /tmp/xray/xray /usr/local/bin/xray \
    && chmod +x /usr/local/bin/xray \
    && rm -rf /tmp/xray*

# 拷贝配置和入口脚本
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 开放端口
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
