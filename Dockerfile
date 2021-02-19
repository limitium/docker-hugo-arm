FROM arm32v7/alpine

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync

ENV VERSION 0.80.0
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-ARM.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo \
    && curl -L https://github.com/tdewolff/minify/releases/download/v2.3.1/minify_2.3.1_linux_arm.tar.gz | tar -xz \
    && mv minify /usr/local/bin/ \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
