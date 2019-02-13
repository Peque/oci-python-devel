FROM fedora:29
RUN dnf update -y \
    && dnf install -y python3-tox \
    && dnf clean all
