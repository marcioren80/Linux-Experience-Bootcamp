# Docker: Utilização Prática no Cenário de Microsserviços

<br>

## Alguns dos "problemas" com a nuvem privada:
- Dificuldades com a segurança da T.I. (lógica e física)
- Custo com mão de obra especializada
- Custo de Hardware
- Custo de energia elétrica
- Custos do uso de geradores em caso de falta de energia elétrica.
- Despesas inesperadas: 
	- Defeito de um disco
	- Defeito de um módulo de memória
	- Defeito da placa mãe do servidor
	- Defeito no ar-condicionado

<br>

## Vantagens da nuvem
- Preço: Paga pelo uso
- Facilidade de contratação, configuração e infraestrutura
- Escalabilidade conforme a necessidade
- Performance.

<br>

## A Arquitetura de microserviços
Microserviços consistem em contruir aplicações separando-as em serviços independentes, mas que se comunicam entre si usando APIs.

Quando quebramos uma aplicação monolítica em pequenas partes, conseguimos escalar esses pequenas partes de forma independente. Um exemplo de um serviço de autenticação que é chamado várias vezes durante um sessão de usuário, ostress sobre ele é maior.

Com microserviços, podemos escalar somente parte ao invès de esclar a aplicação como um todo. Microserviços não precisam necessariamente ser escritos na mesma linguagem de programação.

<br>

## Cluster e Docker Swarm
Cluster é um conjunto de computadores ligados operando como se fosse um único sistema. Cada computador de um cluster é conhecido como nó (node).

O Docker Swarm é um cluster de conteineres; um recurso do Docker que oferece função de orquestração de contêiner, incluindo clustering nativo de hosts do Docker e agendamento de cargas de trablaho, um grupo de hosts do Docker formam um cluster "Swarm".

