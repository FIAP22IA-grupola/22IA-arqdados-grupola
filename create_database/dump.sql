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
  "ID" SERIAL,
  "logradouro" VARCHAR(255) NOT NULL,
  "CEP" VARCHAR(255) NOT NULL,
  "complemento" VARCHAR(255) NULL,
  PRIMARY KEY ("ID"));
  
-- -----------------------------------------------------
-- Table "dindinagora"."cliente"
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS "dindinagora"."cliente" (
  "ID" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255) NOT NULL,
  "RG" VARCHAR(255) NOT NULL,
  "CPF" VARCHAR(255) NOT NULL,
  "enderecoFK" INT NULL,
    CONSTRAINT "fk_cliente_endereco"
    FOREIGN KEY ("enderecoFK")
        REFERENCES "dindinagora"."endereco"("ID")
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
   );

CREATE INDEX "fk_cliente_endereco_idx"
ON "dindinagora"."cliente" ("enderecoFK" ASC);

-- --------------------------------------------------
-- Table "dindinagora"."conta"
-- --------------------------------------------------
-- DROP TABLE "dindinagora"."conta";
CREATE TABLE IF NOT EXISTS "dindinagora"."conta" (
  "ID" SERIAL,
  "cliente_fk" INT NOT NULL,
  "saldo" FLOAT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT fk_conta_cliente
    FOREIGN KEY (cliente_fk)
    REFERENCES "dindinagora"."cliente"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "fk_conta_cliente_idx"
ON "dindinagora"."conta"(cliente_fk);

CREATE UNIQUE INDEX "unique_fk_conta_cliente_idx"
ON "dindinagora"."conta"(cliente_fk);

-- -----------------------------------------------------
-- Table "dindinagora"."transferencia"
-- -----------------------------------------------------
-- DROP TABLE "dindinagora"."transferencia";
CREATE TABLE IF NOT EXISTS "dindinagora"."transferencia" (
  "ID" SERIAL,
  "montante" FLOAT NOT NULL,
  "tipo" CHAR(3),
  "origem_fk" INT NOT NULL,
  "destino_fk" INT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "fk_transferencia_origem"
    FOREIGN KEY (origem_fk)
    REFERENCES "dindinagora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_transferencia_destino"
    FOREIGN KEY (destino_fk)
    REFERENCES "dindinagora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ckeck_transferencia check ("tipo" in ('PIX', 'TED', 'DOC'))
);

CREATE INDEX "fk_transferencia_origem_idx" 
ON "dindinagora"."transferencia"("origem_fk" ASC);
 
CREATE INDEX "fk_transferencia_destino_idx"
ON "dindinagora"."transferencia"("destino_fk" ASC);

-- -----------------------------------------------------
-- Table "dindinagora"."deposito"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dindinagora"."deposito" (
  "ID" SERIAL,
  "montante" FLOAT NOT NULL,
  "conta_fk" INT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "fk_deposito_conta"
    FOREIGN KEY ("conta_fk")
    REFERENCES "dindinagora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE  INDEX "fk_deposito_cliente_idx"
ON "dindinagora"."deposito"("conta_fk" ASC);

-- -----------------------------------------------------
-- Table "dindinagora"."emprestimo"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "dindinagora"."emprestimo" (
  "ID" SERIAL,
  "montante" FLOAT NOT NULL,
  "taxa_aa" FLOAT NOT NULL,
  "conta_fk" INT NOT NULL,
  "parcelas" INT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "fk_emprestimo_conta"
    FOREIGN KEY ("conta_fk")
    REFERENCES "dindinagora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
 CREATE INDEX "fk_emprestimo_cliente_idx" 
 ON "dindinagora"."emprestimo"("conta_fk" ASC);
