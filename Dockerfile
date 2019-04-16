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
        zlib1g-dev      \
        gcc             \
        libbz2-dev      \
        libgsl-dev      \
        libperl-dev     \
        liblzma-dev     \
        libz-dev        \
        make

ADD https://raw.githubusercontent.com/dceoy/print-github-tags/master/print-github-tags /usr/local/bin/print-github-tags

# Shell tool installation
RUN apt-get install -y  \
        bedtools        \
        samtools

RUN wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20190304.zip && \
    unzip plink_linux_x86_64_20190304.zip -d plink && \
    mv plink/plink /usr/local/bin && \
    rm -rf plink plink_linux_x86_64_20190304.zip

RUN set -e \
      && chmod +x /usr/local/bin/print-github-tags \
      && print-github-tags --release --latest --tar samtools/htslib | xargs -i curl -SL {} -o /tmp/htslib.tar.gz \
      && tar xvf /tmp/htslib.tar.gz -C /usr/local/src --remove-files \
      && mv /usr/local/src/htslib-* /usr/local/src/htslib \
      && print-github-tags --release --latest --tar samtools/bcftools | xargs -i curl -SL {} -o /tmp/bcftools.tar.gz \
      && tar xvf /tmp/bcftools.tar.gz -C /usr/local/src --remove-files \
      && mv /usr/local/src/bcftools-* /usr/local/src/bcftools \
      && cd /usr/local/src/bcftools \
      && autoheader \
      && autoconf \
      && ./configure --enable-libgsl --enable-perl-filters \
      && make \
      && make install


# Python tool installation
RUN pip install         \
        numpy           \
        pandas          \
        openpyxl


# R tool installation
# RUN

CMD ["/bin/bash"]




