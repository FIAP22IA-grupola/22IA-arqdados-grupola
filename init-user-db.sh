#!/bin/bash
set -e 

cp -a home/dados_dindin/. /var/lib/postgresql/data

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.endereco
    FROM '/var/lib/postgresql/data/dados_endereco_trat.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.cliente
    FROM '/var/lib/postgresql/data/dados_clientes_trat.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.conta
    FROM '/var/lib/postgresql/data/dados_conta_trat.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.tr_transferencia
    FROM '/var/lib/postgresql/data/dados_tr_transferencia_trat.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.tr_deposito
    FROM '/var/lib/postgresql/data/dados_tr_deposito_trat.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.dim_emprestimo
    FROM '/var/lib/postgresql/data/dados_dim_emprestimo_trat.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname user <<-EOSQL
    COPY dindinagora.tr_emprestimo
    FROM '/var/lib/postgresql/data/dados_tr_emprestimo_trat.csv' 
    DELIMITER ';' 
    CSV HEADER;
EOSQL