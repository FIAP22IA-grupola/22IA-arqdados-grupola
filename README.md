# 22IA-arqdados-grupola

> A DindinAgora, tem sofrido com lentidões em seus sistema transacional principal, onde os clientes
podem se cadastrar, adquirir produtos (crédito) e realizar transações financeiras, como depósitos e
transferências.

> Objetivo, construir um MER (modelo entidade relacional) na terceira forma normal para cadastrar
clientes, com dados cadastrais contendo dados documentais e de endereço, depósitos, aquisições de
produtos de crédito e transferência.

Tabelas: 
* clientes
* endereço
* deposito
* aquisição de produtos de crédito
* transferência

Schemas:
```
cliente:
ID -> Primary Key Int
nome -> String
CPF -> String
RG -> String

endereco:
ID -> Priamry Key Int
logradouro -> String
CEP -> String
Numero -> String
Complemento -> String

cliente_endereco:
ID -> Primary Key Int
enderecoFK -> Foreign Key (endereco)
clienteFK -> Foreign Key (cliente)

deposito:
ID -> Primary Key Int
montante -> Float
Cliente -> Foreign Key (cliente)

aquisicao_de_produtos_de_credito
ID -> Primary Key Int

transferencia
ID -> Primary Key Int
```

Relações

Cliente * ---- * Endereco
(Many to Many)
1 Ciente tem multiplos endereços
1 Endereço tem multiplos clientes

Deposito --- * Clientes
(1 to Many)
1 deposito tem 1 cliente
1 cliente tem multiplos depositos
