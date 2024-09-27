ARG FEDORA_RELEASE="${FEDORA_RELEASE:-41}"
ARG BASE_IMAGE="${BASE_IMAGE:-silverblue}"
ARG IMAGE_REGISTRY=quay.io/fedora-ostree-desktops
ARG FEDORA_IMAGE=${IMAGE_REGISTRY}/${BASE_IMAGE}:${FEDORA_RELEASE}

# Inheriting main image from Fedora source
FROM ${FEDORA_IMAGE} as base

ARG FEDORA_RELEASE
ARG BASE_IMAGE

# Copying system files to image
COPY system-files/base /
COPY system-files/${BASE_IMAGE} /

# Copying build-files to tmp
COPY --chmod=0755 build-files /tmp/build-files

RUN /tmp/build-files/setup.sh --version ${FEDORA_RELEASE} --base ${BASE_IMAGE} && \
    /tmp/build-files/build_initramfs.sh --version ${FEDORA_RELEASE} --base ${BASE_IMAGE} && \
    rpm-ostree cleanup -m && \
    rm -rf /tmp/* /var/* && \
    ostree container commit
