FROM fedora:29
RUN dnf update -y \
    && dnf install -y \
        gcc \
        gcc-c++ \
        python3-tox \
    && dnf clean all
