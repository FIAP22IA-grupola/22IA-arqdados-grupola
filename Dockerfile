FROM postgres:latest

ENV POSTGRES_DB DinDinAgora
ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD admin
ENV PGDATA '/var/lib/postgresql/data'

RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8

RUN apt update -y && \
    apt install -y git

RUN cd /home && \
    git clone https://github.com/FIAP22IA-grupola/22IA-arqdados-grupola.git

#fazendo agora a copia dos arquivos de dados para o diretorio certo
COPY create_database/dados/. ${PGDATA}

COPY create_host/dump.sql /docker-entrypoint-initdb.d/

EXPOSE 5432




