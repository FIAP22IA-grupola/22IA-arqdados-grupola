-- Script criacao POstgres SQL

-- -----------------------------------------------------
-- Schema dindinagora
-- -----------------------------------------------------
SET client_encoding = 'latin1';

CREATE SCHEMA IF NOT EXISTS "dindinagora"
  AUTHORIZATION "user";

-- -----------------------------------------------------
-- Table "dindinagora"."endereco"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dindinagora"."endereco" (
  "id" SERIAL PRIMARY KEY,
  "logradouro" VARCHAR(255) NOT NULL,
  "cep" VARCHAR(255) NOT NULL,
  "complemento" VARCHAR(255) NULL
  );
  
-- -----------------------------------------------------
-- Table "dindinagora"."cliente"
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS "dindinagora"."cliente" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255) NOT NULL,
  "RG" VARCHAR(255) NOT NULL,
  "CPF" VARCHAR(255) NOT NULL,
  "endereco_fk" INT NOT NULL,
    CONSTRAINT "fk_cliente_endereco"
    FOREIGN KEY ("endereco_fk")
        REFERENCES "dindinagora"."endereco"("id")
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
  );

CREATE INDEX "fk_cliente_endereco_idx"
ON "dindinagora"."cliente" ("endereco_fk" ASC);

-- --------------------------------------------------
-- Table "dindinagora"."conta"
-- --------------------------------------------------
-- DROP TABLE "dindinagora"."conta";
CREATE TABLE IF NOT EXISTS "dindinagora"."conta" (
  "id" SERIAL PRIMARY KEY,
  "cliente_fk" INT NOT NULL,
  "tipo" VARCHAR(255),
  "saldo" FLOAT NOT NULL,
  CONSTRAINT "fk_conta_cliente"
  FOREIGN KEY ("cliente_fk")
    REFERENCES "dindinagora"."cliente"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ckeck_tipoconta check ("tipo" in ('Conta Poup', 'Conta Corr'))
  );

CREATE UNIQUE INDEX "unique_fk_conta_cliente_idx"
ON "dindinagora"."conta"(cliente_fk,tipo);

-- -----------------------------------------------------
-- Table "dindinagora"."transferencia"
-- -----------------------------------------------------
-- DROP TABLE "dindinagora"."transferencia";
CREATE TABLE IF NOT EXISTS "dindinagora"."tr_transferencia" (
  "id" SERIAL PRIMARY KEY,
  "montante" FLOAT NOT NULL,
  "tipo" CHAR(3),
  "data_hora_transacao" TIMESTAMP NOT NULL,
  "origem_fk" INT NOT NULL,
  "destino_fk" INT NOT NULL,
  CONSTRAINT "fk_transferencia_origem"
    FOREIGN KEY (origem_fk)
    REFERENCES "dindinagora"."conta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_transferencia_destino"
    FOREIGN KEY (destino_fk)
    REFERENCES "dindinagora"."conta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ckeck_transferencia check ("tipo" in ('PIX', 'TED', 'DOC'))
);

CREATE INDEX "fk_transferencia_origem_destino_idx"
ON "dindinagora"."tr_transferencia"("origem_fk","destino_fk");

-- -----------------------------------------------------
-- Table "dindinagora"."deposito"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dindinagora"."tr_deposito" (
  "id" SERIAL PRIMARY KEY,
  "montante" FLOAT NOT NULL,
  "conta_fk" INT NOT NULL,
  "data_hora_transacao" TIMESTAMP NOT NULL,
  CONSTRAINT "fk_deposito_conta"
    FOREIGN KEY ("conta_fk")
    REFERENCES "dindinagora"."conta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE  INDEX "fk_deposito_cliente_idx"
ON "dindinagora"."tr_deposito"("conta_fk" ASC);

-- -----------------------------------------------------
-- Table "dindinagora"."emprestimo"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dindinagora"."dim_emprestimo" (
  "id" SERIAL PRIMARY KEY,
  "montante" FLOAT NOT NULL,
  "taxa_aa" FLOAT NOT NULL,
  "parcelas" INT NOT NULL
);
    
 CREATE INDEX "dim_emprestimo_idx" 
 ON "dindinagora"."dim_emprestimo"("id" ASC);

 -- -----------------------------------------------------
-- Table "dindinagora"."emprestimo"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dindinagora"."tr_emprestimo" (
  "id" SERIAL PRIMARY KEY,
  "conta_fk" INT NOT NULL,
  "emprestimo_fk" INT NOT NULL,
  "data_hora_emprestimo" TIMESTAMP NOT NULL,
  CONSTRAINT "fk_emprestimo_conta"
  FOREIGN KEY ("conta_fk")
    REFERENCES "dindinagora"."conta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_emprestimo"
    FOREIGN KEY ("emprestimo_fk")
    REFERENCES "dindinagora"."dim_emprestimo"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
 CREATE INDEX "fk_emprestimo_cliente_idx" 
 ON "dindinagora"."tr_emprestimo"("conta_fk","emprestimo_fk");
