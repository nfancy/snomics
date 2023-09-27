FROM rocker/tidyverse:4.2.3

## install linux libraries
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
apt-utils \
libglpk-dev \##library for igraph
libhdf5-dev \##library for hdf5
patch \##library for hdf5r compilation 
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

## install R packages from CRAN 
RUN install2.r -e \
argparse \
RCurl \
hdf5r \
Seurat \
&& rm -rf /tmp/downloaded_packages

## install R packages from bioconductor
COPY requirements-bioc.R .
RUN Rscript -e 'requireNamespace("BiocManager"); BiocManager::install(ask=F);' \
&& Rscript requirements-bioc.R \
&& rm -rf /tmp/downloaded_packages
