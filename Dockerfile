FROM ubuntu:18.04

# Basic system
RUN apt-get clean all && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  \
        autotools-dev   \
        automake        \
        cmake           \
        curl            \
        grep            \
        sed             \
        dpkg            \
        fuse            \
        git             \
        wget            \
        zip             \
        openjdk-8-jre   \
        build-essential \
        pkg-config      \
        python          \
        python-dev      \
        python-pip      \
        bzip2           \
        ca-certificates \
        libglib2.0-0    \
        libxext6        \
        libsm6          \
        libxrender1     \
        mercurial       \
        subversion      \
        zlib1g-dev

# Shell tool installation
RUN apt-get install -y  \
        bedtools        \
        samtools

# Python tool installation
RUN pip install         \
        pybedtools


# R tool installation
# RUN

CMD ["/bin/bash"]
