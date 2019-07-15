FROM fedora:30

ENV LANG C.UTF-8

RUN dnf update -y \
    && dnf install -y \
        conda \
        curl \
        gcc \
        gcc-c++ \
        git \
        pipenv \
        python3-tox \
        wget \
        which \
    && dnf clean all

# Poetry
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python3
RUN source $HOME/.poetry/env && poetry self:update --preview
RUN mv $HOME/.poetry/bin/poetry /usr/local/bin/
RUN mv $HOME/.poetry/lib/poetry /usr/local/lib/
