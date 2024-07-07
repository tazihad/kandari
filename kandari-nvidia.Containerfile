ARG SOURCE_IMAGE="kinoite"
ARG SOURCE_SUFFIX="-nvidia"
ARG SOURCE_TAG="latest"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
