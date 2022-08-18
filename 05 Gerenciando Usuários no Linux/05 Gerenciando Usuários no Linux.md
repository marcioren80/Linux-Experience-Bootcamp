# Gerenciando Usuários no Linux
## Criando e excluindo usuários

A maioria das tarefas em um ambiente de servidor precisa ser executada por um usuário com permissões mais altas, já para acesso a pastas de arquivos ou apesas utilizar serviços, não é necessário que o usuário tenha altas permissões. Aqui veremos as principais configurações de usuários.

<br>
Criando um usuário simples:

>   root@ubuntu-srv-dio:/# useradd joao

<br>
Excluindo o usuário:

>   root@ubuntu-srv-dio:/home# userdel -f joao

<br>
Parâmetros básicos para criar um usuário, veja mais em **useradd --help**:

> root@ubuntu-srv-dio:/home# useradd --help <br>
>
>   -c, --comment COMMENT         GECOS field of the new account<br>
>   \- Usado para colocar o nome completo do usuário.
>
>  -m, --create-home             create the user's home directory <br>
>   \- Usado para criar o diretório home com o nome do usuário.

<br>

Criar usuário já com pasta home:

>   root@ubuntu-srv-dio:/home# useradd joao -m -c "João da Silva" <br>
>   root@ubuntu-srv-dio:/home# ls <br>
>   joao  marcio <br>
>   root@ubuntu-srv-dio:/home#

<br>

Definir a senha do usuário _joao_