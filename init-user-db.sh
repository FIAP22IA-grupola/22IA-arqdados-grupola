#!/bin/bash
set -e 

cp -a home/dados_dindin/. /var/lib/postgresql/data

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.cliente
    FROM '/var/lib/postgresql/data/dados_clientes_3.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL