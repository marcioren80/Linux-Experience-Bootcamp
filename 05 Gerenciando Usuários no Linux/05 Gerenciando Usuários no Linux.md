# Gerenciando Usuários no Linux

<br>

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

>   root@ubuntu-srv-dio:/home# useradd joao -m -c "João da Silva" -s /bin/bash <br>
>   root@ubuntu-srv-dio:/home# ls <br>
>   joao  marcio <br>
>   root@ubuntu-srv-dio:/home#

<br>
Definir a senha do usuário _joao_:

>   root@ubuntu-srv-dio:/home# passwd joao <br>
>   New password: <br>
>   Retype new password: <br>
>   passwd: password updated successfully <br>
>   root@ubuntu-srv-dio:/home# <br>

<br>
Caso tenha se esquecido de definir o shell do usuário:

>   root@ubuntu-srv-dio:/home# chsh -s /bin/bash joao

<br>

## Editando informações do usuário

<br>
Caso tenha a necessidade de criar um usuário temporário, até mesmo com data de expiração, você pode utilizar o parâmetro "-e, --expiredate" EXPIRE_DATE  expiration date of the new account:

>   root@ubuntu-srv-dio:/# useradd guest -c "Convidado" -m -e 10/10/2022 <br>

<br>
Outro modo de corrigir o bash do usuário:

> root@ubuntu-srv-dio:/# usermod guest -s /bin/bash <br>
> root@ubuntu-srv-dio:/# 

<br>
Forçar expiração de senha do usuário:

>   root@ubuntu-srv-dio:/# passwd guest -e

Caso queira definir uma data específica de expiração de senha é só colocar o dia no formato dd/mm/yyyy após o -e

<br>
Ver os usuários criados no sistema:

>   root@ubuntu-srv-dio:/# cat /etc/passwd

<br>

## Shell Script - Criando usuários em lote

<br>
Vamos ver primeiro como podemos criar um usuário já com senha inicial definida:

>   root@ubuntu-srv-dio:/# useradd convidado1 -c "Convidado especial" -s /bin/bash -m -p $(openssl passwd senha123)

<br>
As vezes vejo nos fóruns o pessoal faz uma pergunta simples, em que a resposta deveria ser só uma linha de comando, duas no máximo, mas o pessoal "mais sênior" gosta de responder com scrits mirabolantes, muitas vezes já passando longo do nível de conhecimento de quem fez a pergunta. Não é menosprezar e superestimar, mas é começar pelo mais simples, aí se o usuário que perguntou estiver precisando de algo mais elaborado, aí sim partir para essas respostas com scritps cheios das firulas dos "do this" e "do that".

Ao montar um script, o admninstrador pode criar algo como:

>   root@ubuntu-srv-dio:/# useradd convidado1 -c "Convidado especial" -s /bin/bash -m -p $(openssl passwd senha123)

O parâmetro -p $(openssl passwd senha123) já passa a senha cryptografada.

<br>
useradd sem criptografia:

>   root@ubuntu-srv-dio:/# useradd convidado2 -c "Convidado especial2" -s /bin/bash -m -p senha123

<br>
Como podemos ver no resultado abaixo:

>   root@ubuntu-srv-dio:/# cat /etc/shadow | grep convidado
convidado1:$1$IAPxrKTB$RZs7rHqGa0R4/1zcOHGH6/:19222:0:99999:7:::
convidado2:senha123:19222:0:99999:7:::

OBS: Você pode se deparar com algumas versões do server em que pode ser que seja necessário o parâmetro adicional -crypt:

   -p $(openssl passwd -crypt senha123)

<br>

## Adicionando usuários a grupos

<br>
Ver os grupos existentes no sistema:

>   root@ubuntu-srv-dio:/# cat /etc/group

<br>

Adicionando um usuário a um ou mais grupos:

>   root@ubuntu-srv-dio:/# usermod -G adm,sudo barbara

<br>

## Criando novos grupos

<br>
Exemplos de grupos criados:

>   root@ubuntu-srv-dio:/# groupadd GRP_ADM
>   root@ubuntu-srv-dio:/# groupadd GRP_VEN
>   root@ubuntu-srv-dio:/# groupadd GRP_TESTE

<br>
Apagando um grupo:

>   root@ubuntu-srv-dio:/# groupdel GRP_TESTE

<br>
Criando um usuário e já adionar ao um grupo:

>   root@ubuntu-srv-dio:/# useradd rafaela -c "Rafaela Lima" -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_ADM

<br>
Observação: ao utilizar o usermod -G, tenha em mente que o usuário será removido dos grupos anteriores. Se você precisa que o usuário seja mantido, informe no comando todos os grupos que o usuário deve pertencer. Ex:

>   root@ubuntu-srv-dio:/# cat /etc/group | grep GRP <br>
>   GRP_ADM:x:1008:rafaela,juliana <br>
>   GRP_VEN:x:1009:maria,joao <br>
>   root@ubuntu-srv-dio:/# usermod -G adm,sudo,GRP_ADM,GRP_VEN barbara <br>
>   root@ubuntu-srv-dio:/# cat /etc/group | grep GRP <br>
>   GRP_ADM:x:1008:rafaela,juliana,barbara <br>
>   GRP_VEN:x:1009:maria,joao,barbara <br>
