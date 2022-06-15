# Trabalho Banco de dados DinDin Agora

Cenário: A DinDinAgora está no mercado, os investidores veem muito potencial. Porém, com o
crescimento e o investimento acelerado existe a necessidade de melhor escalabilidade. Com este
cenário em mente, iremos evoluir a arquitetura de Dados da DinDinAgora para que seja possível
escalar todo o ambiente de Dados habilitando maior agilidade, estabilidade e confiança na entrega de
dados.

No fim da matéria teremos um desenho de arquitetura de Dados completo, escalável e aderente a
diferentes aplicações e necessidades de negócio.
A cada aula esta arquitetura será incrementada, conforme necessidades de bases relacionais, Bases
analíticas e NoSQL.

## Primeira entrega 

### Enunciado 
A DindinAgora, tem sofrido com lentidões em seus sistema transacional principal, onde os clientes
podem se cadastrar, adquirir produtos (crédito) e realizar transações financeiras, como depósitos e
transferências.
Vocês como arquitetos de dados identificam que a problemática ocorre, por falhas na estrutura de
dados, que não está normalizada corretamente.
Objetivo, construir um MER (modelo entidade relacional) na terceira forma normal para cadastrar
clientes, com dados cadastrais contendo dados documentais e de endereço, depósitos, aquisições de
produtos de crédito e transferência.

### Entrega:

- Arquivo com o desenho do Modelo com todas suas relações descritas <span style="color:green">*OK*</span> ;
- DDL’s para criação do modelo físico <span style="color:green">*OK*</span> .

## Segunda entrega 

### Enunciado 
Uma vez que a DindinAgora está com seu Sistema transactional modelado de forma normalizada e 
otimizado, agora precisamos construir um Data WareHouse para ferar relatórios, gráficos para 
diretoria e analises.

Esse Data Warehouse deve conter fatos descrevendo, depósitos, transferências e contratações. E as 
dimensões devem descrever os produtos, categoria de cliente, tempo (quando) e outras dimensões
que vocês entendam importantes para o negócio da DinDinAgora.

### Entrega:

- Arquivo com o desenho do Modelo com todas suas relações descritas <span style="color:green">*OK*</span>;
- DDL’s para criação do modelo físico <span style="color:green">*OK*</span>. 

## Terceira Entrega

### Enunciado
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

Com base nessas informações vocês devem selecionar uma tecnologia para armazenar esses dados,
permitindo inicialmente uma resposta muito rápida para mudanças de valores e num Segundo 
momento atender o produto de predição.
Também criar um modelo de dados para acompanhar e gerar alertas nas mudanças de valor.

### Entrega

- Apresentação com as tecnologias selecionadas e justificativas <span style="color:orange">*Pendente*</span> ;
- DDL’s para criação do modelo físico em Cassandra <span style="color:orange">*Pendente*</span> ;
- Estrutura Json exemplo do Modelo Mongo <span style="color:orange">*Pendente*</span> .