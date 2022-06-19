FROM postgres:latest

ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD admin
ENV DINDIN_DATA '/home/dados_dindin'

RUN locale-gen "pt_BR.UTF-8"
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LC_ALL "pt_BR.UTF-8"
ENV LC_CTYPE "pt_BR.UTF-8"

#fazendo agora a copia dos arquivos de dados para o diretorio certo
COPY create_database/dados/. ${DINDIN_DATA}

COPY create_database/dump.sql /docker-entrypoint-initdb.d/

COPY init-user-db.sh /docker-entrypoint-initdb.d/

RUN chmod a+r /docker-entrypoint-initdb.d/*

EXPOSE 5432



