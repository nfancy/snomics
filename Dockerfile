FROM rocker/tidyverse:4.2.3

RUN apt-get update -qq

RUN install2.r -e \
argparse \
RCurl \
&& rm -rf /tmp/downloaded_packages
