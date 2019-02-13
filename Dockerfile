FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y \
        python3-pip \
        python3.5 \
        python3.6 \
        python3.7 \
    && pip3 install tox \
    && rm -rf /var/cache/apt/lists
