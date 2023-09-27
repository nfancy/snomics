FROM rocker/tidyverse:4.2.3

RUN apt-get update -qq

RUN install2.r -e \
argparse \
RCurl \
hdf5r \
Seurat \
&& rm -rf /tmp/downloaded_packages

RUN Rscript -e 'requireNamespace("BiocManager"); BiocManager::install(ask=F);' \
&& Rscript requirements-bioc.R \
&& rm -rf /tmp/downloaded_packages
