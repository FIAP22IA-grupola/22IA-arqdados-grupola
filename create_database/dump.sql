-- Script criacao POstgres SQL

-- -----------------------------------------------------
-- Schema DinDinAgora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS "DinDinAgora"
  AUTHORIZATION "user";

-- -----------------------------------------------------
-- Table "DinDinAgora"."endereco"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "DinDinAgora"."endereco" (
  "ID" SERIAL,
  "logradouro" VARCHAR(255) NOT NULL,
  "CEP" VARCHAR(255) NOT NULL,
  "complemento" VARCHAR(255) NULL,
  PRIMARY KEY ("ID"));
  
-- -----------------------------------------------------
-- Table "DinDinAgora"."cliente"
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS "DinDinAgora"."cliente" (
  "ID" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255) NOT NULL,
  "RG" VARCHAR(255) NOT NULL,
  "CPF" VARCHAR(255) NOT NULL,
  "enderecoFK" INT NULL,
    CONSTRAINT "fk_cliente_endereco"
    FOREIGN KEY ("enderecoFK")
        REFERENCES "DinDinAgora"."endereco"("ID")
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
   );

CREATE INDEX "fk_cliente_endereco_idx"
ON "DinDinAgora"."cliente" ("enderecoFK" ASC);

-- --------------------------------------------------
-- Table "DinDinAgora"."conta"
-- --------------------------------------------------
-- DROP TABLE "DinDinAgora"."conta";
CREATE TABLE IF NOT EXISTS "DinDinAgora"."conta" (
  "ID" SERIAL,
  "cliente_fk" INT NOT NULL,
  "saldo" FLOAT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT fk_conta_cliente
    FOREIGN KEY (cliente_fk)
    REFERENCES "DinDinAgora"."cliente"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "fk_conta_cliente_idx"
ON "DinDinAgora"."conta"(cliente_fk);

CREATE UNIQUE INDEX "unique_fk_conta_cliente_idx"
ON "DinDinAgora"."conta"(cliente_fk);

-- -----------------------------------------------------
-- Table "DinDinAgora"."transferencia"
-- -----------------------------------------------------
-- DROP TABLE "DinDinAgora"."transferencia";
CREATE TABLE IF NOT EXISTS "DinDinAgora"."transferencia" (
  "ID" SERIAL,
  "montante" FLOAT NOT NULL,
  "tipo" CHAR(3),
  "origem_fk" INT NOT NULL,
  "destino_fk" INT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "fk_transferencia_origem"
    FOREIGN KEY (origem_fk)
    REFERENCES "DinDinAgora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_transferencia_destino"
    FOREIGN KEY (destino_fk)
    REFERENCES "DinDinAgora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ckeck_transferencia check ("tipo" in ('PIX', 'TED', 'DOC'))
);

CREATE INDEX "fk_transferencia_origem_idx" 
ON "DinDinAgora"."transferencia"("origem_fk" ASC);
 
CREATE INDEX "fk_transferencia_destino_idx"
ON "DinDinAgora"."transferencia"("destino_fk" ASC);

-- -----------------------------------------------------
-- Table "DinDinAgora"."deposito"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "DinDinAgora"."deposito" (
  "ID" SERIAL,
  "montante" FLOAT NOT NULL,
  "conta_fk" INT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "fk_deposito_conta"
    FOREIGN KEY ("conta_fk")
    REFERENCES "DinDinAgora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE  INDEX "fk_deposito_cliente_idx"
ON "DinDinAgora"."deposito"("conta_fk" ASC);

-- -----------------------------------------------------
-- Table "DinDinAgora"."emprestimo"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "DinDinAgora"."emprestimo" (
  "ID" SERIAL,
  "montante" FLOAT NOT NULL,
  "taxa_aa" FLOAT NOT NULL,
  "conta_fk" INT NOT NULL,
  "parcelas" INT NOT NULL,
  PRIMARY KEY ("ID"),
  CONSTRAINT "fk_emprestimo_conta"
    FOREIGN KEY ("conta_fk")
    REFERENCES "DinDinAgora"."conta"("ID")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
 CREATE INDEX "fk_emprestimo_cliente_idx" 
 ON "DinDinAgora"."emprestimo"("conta_fk" ASC);
