# Servidor de Banco de Dados com Linux

## O que é um servidor de banco de dados?

Um servidor de banco de dados armazena os dados como, por exemplo, de informações de usuários de um site, informações de alunos de uma escola, informações de livros de uma biblioteca, etc.

1. Oracle. Esse tipo de SGBD é, sem d.idas, um dos tipos de bancos de dados m.s utilizados no mercado.
2. SQL Server.
3. MySQL (Também da Oracle).
4. PostgreSQL.
5. MongoDB.
6. NoSQL.

É sempre recomndável que o servidor de BD não esteja no mesmo servidor que provê http.

<br>

## Instalando o MySQL

> root@ubuntu-srv-dio:/# apt search mysql-server <br>
> >mysql-server-8.0/jammy-updates,jammy-security,now 8.0.30-0ubuntu0.22.04.1 amd64 [installed] <br>
>   __*MySQL database server binaries and system database setup*__ <br>
> 
> root@ubuntu-srv-dio:/# apt install mysql-server-8.0

<br>

## Acessando o Banco de Dados:

>     root@ubuntu-srv-dio:/# mysql -u root -p
>     Enter password:
>     Welcome to the MySQL monitor.  Commands end with ; or \g.
>     Your MySQL connection id is 8
>     Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)
>     
>     Copyright (c) 2000, 2022, Oracle and/or its affiliates.
>     
>     Oracle is a registered trademark of Oracle Corporation and/or its
>     affiliates. Other names may be trademarks of their respective
>     owners.
>     
>     Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
>     
>     mysql>

<br>
Exibir Banco de Dados criados

>     mysql> show databases;
>     +--------------------+
>     | Database           |
>     +--------------------+
>     | information_schema |
>     | mysql              |
>     | performance_schema |
>     | sys                |
>     +--------------------+
>     4 rows in set (0,04 sec)
>     
>     mysql>

<br>
Criar um novo Banco de Dados

>     mysql> create database meubanco;
>     Query OK, 1 row affected (0,01 sec)
>     
>>     mysql> show databases;
>>     +--------------------+
>>     | Database           |
>>     +--------------------+
>>     | information_schema |
>>     | meubanco           |
>>     | mysql              |
>>     | performance_schema |
>>     | sys                |
>>     +--------------------+
>>     5 rows in set (0,00 sec)
>     
>     mysql>

<br>
Acessar o Banco de Dados criado:

>     mysql> use meubanco
>     Database changed

<br>
Criar uma tabela neste banco:

>     mysql> create table Pessoas (PessoasID int, Nome varchar(50), Sobrenome varchar(50), Endereço varchar(100), Cidade varchar(50));
>     Query OK, 0 rows affected (0,02 sec)
>
>>     mysql> show tables;
>>     +--------------------+
>>     | Tables_in_meubanco |
>>     +--------------------+
>>     | Pessoas            |
>>     +--------------------+
>>     1 row in set (0,00 sec)
>     
>     mysql>

<br>
Adicionando dados a uma tabela:

>     mysql> insert into Pessoas (PessoasID, Nome, Sobrenome, Endereço, Cidade) VALUES (1, 'Carlos', 'da >     Silva', 'Av. St. Amaro, 500', 'São Paulo-SP');
>     Query OK, 1 row affected (0,01 sec)
>     
>     mysql>

<br>
Consultar tabela:

>     mysql> select * from Pessoas;
>     +-----------+--------+-----------+--------------------+---------------+
>     | PessoasID | Nome   | Sobrenome | Endereço           | Cidade        |
>     +-----------+--------+-----------+--------------------+---------------+
>     |         1 | Carlos | da Silva  | Av. St. Amaro, 500 | São Paulo-SP  |
>     +-----------+--------+-----------+--------------------+---------------+
>     1 row in set (0,00 sec)
>     
>     mysql>

