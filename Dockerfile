FROM lsiobase/nginx:3.11

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="stuarthua"

# arg and env
ARG ARIA2_VERSION
ARG ARIA2WEBUI_1_VERSION
ARG ARIA2WEBUI_2_VERSION

ENV ARIA2_VERSION 1.35.0-r0
ENV ARIA2WEBUI_1_VERSION fb9d758d5cdc2be0867ee9502c44fd17560f5d24
ENV ARIA2WEBUI_2_VERSION 1.1.4
ENV TRACKERSAUTO YES

RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    unzip \
    tar \
    curl \
    openssl \
    aria2=${ARIA2_VERSION} && \
  echo "**** setup env ****" && \
  mkdir -p /data/aria2-webui-1 /data/aria2-webui-2 && \
  mkdir -p /tmp/aria2-webui-1 /tmp/aria2-webui-2 && \
  mkdir -p /data/config /data/downloads && \
  echo "**** install aria2-webui ****" && \
  curl -sSL https://github.com/ziahamza/webui-aria2/archive/${ARIA2WEBUI_1_VERSION}.tar.gz | tar xz -C /tmp/aria2-webui-1 --strip-components=1 && \
  cp -R /tmp/aria2-webui-1/docs/* /data/aria2-webui-1 && \
  echo "**** install aria2-ng ****" && \
  curl -sSL https://github.com/mayswind/AriaNg/releases/download/${ARIA2WEBUI_2_VERSION}/AriaNg-${ARIA2WEBUI_2_VERSION}.zip -o /tmp/AriaNg-${ARIA2WEBUI_2_VERSION}.zip && \
  unzip -q /tmp/AriaNg-${ARIA2WEBUI_2_VERSION}.zip -d /data/aria2-webui-2 && \
  echo "**** cleanup ****" && \
  apk del unzip tar && \
  rm -rf \
	  /tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 4040 6882 6882/udp
VOLUME /data /config/keys