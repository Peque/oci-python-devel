FROM fedora:29

ENV LANG C.UTF-8

RUN dnf update -y \
    && dnf install -y \
        gcc \
        gcc-c++ \
        git \
        pipenv \
        python3-tox \
    && dnf clean all
