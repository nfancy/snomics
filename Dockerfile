FROM rocker/tidyverse:4.2.3

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
apt-utils \
libhdf5-dev \
patch \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
 
RUN install2.r -e \
argparse \
RCurl \
hdf5r \
Seurat \
&& rm -rf /tmp/downloaded_packages

COPY requirements-bioc.R .
RUN Rscript -e 'requireNamespace("BiocManager"); BiocManager::install(ask=F);' \
&& Rscript requirements-bioc.R \
&& rm -rf /tmp/downloaded_packages
