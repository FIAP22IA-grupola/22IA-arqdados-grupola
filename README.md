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

> * a dll (comandos para criação do banco) se encontra no arquivo [dump.sql](/create_database/dump.sql).
>  O modelo está em pdf no arquivo [diagram_schema.png](/diagram_schema.png) . 

segue abaixo um preview do arquivo `diagram_schema.png`:
![image](https://raw.githubusercontent.com/FIAP22IA-grupola/22IA-arqdados-grupola/main/diagram_schema.png)

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

> **Para análises temporais com Machine Learning**: Podemos utulizar a arquitetura OLAP como o do Cassandra para melhor eficiência, aproveitando de sua esturura de cubos que já possuem uma agregação na visão necessária. Aqui será necessário transferir todos os dados transacionais que temos no schema, sendo eles depósitos, treansferências e emprestimos.

> **Para a melhoria nas requisições de consulta por tipo de produto e infos dos clientes**: Podemos nos aproveitar da agilidade de consulta de um banco MongoDB NoSQL, que atualmente é bastante usado para integrações na web, pois sua arquitetura não estruturada não depende de indexações sequenciais na busca de um cliente. Nesta arquitetura podemos transferir os dados de empréstimos que são um dos produtos oferecidos pela solução da DinDinAgora.

## Pergunta 2:

Os arquivos de instrução do banco, bem como de criação deles estão na pasta *create_database*

Existe um arquivo para gerar todo o ambiente de teste que fizemos para esse trabalho na pasta. Basta selecionar um diretório para trabalho e reproduzir o cenário com:

`git clone https://github.com/FIAP22IA-grupola/22IA-arqdados-grupola.git`

E nesse mesmo diretório, subir os containers que utilizamos o recurso do compose na versão 3.8: 

`docker-compose up`

Após isso, irá se criar um eco-sistema em que vão existir os seguintes containers:

- **dindin_pgdatabase**: Neste container vão estar os dados que foram proejtados na parte 1 e 2 dessa atividade. Este container sobe a instância, cria as tabelas do schema e já importa no momento em que o container está sendo criado;
- **pgadmin4_container**: Container usado para verificar as bases de dados diretamente no banco com sql nativo;
- **jupyter_lab_dindinagora**: utilizado para simuçar as situações de consulta que precisariamos nos novos bancos, bem como também esquematizar a arquitetura de como seria a solução para a parte 3 do problema;
- **container_name: dindin_mongo**: Banco de documentos do MongoDB que guardará informações de empréstimos, como um catalogo de produtos.
- **dindin_mongo-express**:IDE para conferir os documentos salvos no MongoDB
- **dindin_cassandra**:Container que já possui 3 emdpoints pré setados do Cassandra, que servem de um "mini cluster" da apache para consumo dos bancos de dados

No arquivo [teste_import_postgres.ipynb](teste_import_postgres.ipynb) descorremos sobre como fazer a implementação da solução de banco de dados, além de também realizarmos testes de performance de consumo através de um notebook no mesmo cluster onde estão os containers na rede do host.
