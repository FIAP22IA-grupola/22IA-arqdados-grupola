FROM postgres:latest

RUN apt update -y && \
    apt install -y git

RUN cd /var/lib/postgresql/data && \
    git clone some_uri

