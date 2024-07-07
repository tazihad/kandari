ARG SOURCE_IMAGE="kinoite"
ARG SOURCE_SUFFIX="-nvidia"
ARG SOURCE_TAG="latest"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY scripts /tmp/scripts


RUN mkdir -p /var/lib/alternatives && \
    /tmp/scripts/remove-packages.sh && \
    /tmp/scripts/install-packages.sh && \
    /tmp/scripts/post-install.sh && \
    ostree container commit