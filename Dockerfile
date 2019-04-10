FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install libcurl4-openssl-dev libssl-dev libxml2-dev -y
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
FROM rocker/r-ver:3.5.3
ARG WHEN
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_version('tidyverse', '1.2.1')"
WORKDIR /app
COPY filter_csv.R /app/
ENTRYPOINT ["Rscript", "filter_csv.R"]

