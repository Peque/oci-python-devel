FROM fedora:30

ENV LANG C.UTF-8

RUN dnf update -y \
    && dnf install -y \
        bzip2 \
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
RUN wget --quiet https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py -O ~/poetry.py && \
    sed -i "s/^POETRY_HOME.*=.*/POETRY_HOME = \"\/opt\/poetry\"/" ~/poetry.py && \
    python3 ~/poetry.py -y --preview && \
    rm ~/poetry.py

# Conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda update -y -n base -c defaults conda && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

ENV PATH="/opt/poetry/bin:/opt/conda/bin:${PATH}"
