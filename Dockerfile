FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y \
        tox \
        python3.5 \
        python3.6 \
        python3.7 \
    && rm -rf /var/cache/apt/lists
