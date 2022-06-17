# 22IA-arqdados-grupola

## Integrantes
Marcelo Leopoldo e Silva de Carvalho Filho - RM342876

Mike Willian Garcia - RM336702

Rubens Elias Francischetti Alasmar - RM343659

Lucas Augusto Ribeiro - RM343289

## Enunciado parte 1 e 2

A DindinAgora, tem sofrido com lentidões em seus sistema transacional principal, onde os clientes
podem se cadastrar, adquirir produtos (crédito) e realizar transações financeiras, como depósitos e
transferências.

Objetivo, construir um MER (modelo entidade relacional) na terceira forma normal para cadastrar
clientes, com dados cadastrais contendo dados documentais e de endereço, depósitos, aquisições de
produtos de crédito e transferência.

## Arquivos

> * a dll (comandos para criação do banco) se encontra no arquivo [DinDinAgora.sql](/DinDinAgora.sql).
>  O modelo está em pdf no arquivo [diagram.pdf](/diagram.pdf) . 

segue abaixo um preview do arquivo `diagram.pdf`:
![image](https://user-images.githubusercontent.com/49515264/157539384-b0846d29-2a47-4dc1-b4f6-7b84a3566ffb.png)

## Enunciado Parte 3

Uma vez que a DindinAgora está tem recebido muitas reclamações sobre demora no carregamento
dos dados do catalogo de produtos, tanto em seu site quanto aplicativo, alguns detalhes dos 
produtos demora vários segundos, as vezes minute para ser apresentado.

O time de tecnologia atuou na API e microserviço desta funcionalidade, porém identificou que a 
demora é o tempo de resposta do banco de dados (RDBMS).

Para solucionar esta problemática vocês como responsáveis pela arquitetura de dados, devem propor
um banco adequado para este cenário e desenhar o modelo de dados mais adequado.

O time de produto DinDin agora está desenvolvendo uma solução baseada em Machine learning, 
para apresentar alertas em tempo real sobre altas e baixas dos valores dos seus produtos (Renda fixa
e renda variavel), existe uma previsão de que esta funcionalidade terá alto impacto na usabilidade da 
Plataforma.

Também há um projeto no RoadMap de desenvolver uma solução que com base em dados temporais
externos como, macroeconomicos, climáticos e sentimentos combinados com a evolução no tempo 
de métricas sobre os produtos seja possível gerar algum nível de previsão de movimento de alta ou
de baixa, ou seja em um funcionalidade premium apontar a probabilidade de um produto valorizar
ou não.

> **Pergunta 1**: Com base nessas informações vocês devem selecionar uma tecnologia para armazenar esses dados,
permitindo inicialmente uma resposta muito rápida para mudanças de valores. 

>**Pergunta 2** : Num Segundo 
momento atender o produto de predição.
Também criar um modelo de dados para acompanhar e gerar alertas nas mudanças de valor.

## Pergunta 1
Para poder atender às necessidades de melhoria na eficiência do banco, podemos adotar 2 arquiteturas principais para cada temática:

> **Para análises temporais com Machine Learning**: Podemos utulizar a arquitetura OLAP como o do Cassandra para melhor eficiência, aproveitando de sua esturura de cubos que já possuem uma agregação na visão necessária.

> **Para a melhoria nas requisições de consulta por tipo de produto e infos dos clientes**: Podemos nos aproveitar da agilidade de consulta de um banco MongoDB NoSQL, que atualmente é bastante usado para integrações na web, pois sua arquitetura não estruturada não depende de indexações sequenciais na busca de um cliente.

## Pergunta 2:

Os arquivos de instrução do banco, bem como de criação deles estão na pasta *create_database*

