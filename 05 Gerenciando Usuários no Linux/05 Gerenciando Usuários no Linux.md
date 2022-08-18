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

## Shell Script - Criando usuários em lote

<br>
Vamos ver primeiro como podemos criar um usuário já com senha inicial definida:

>   root@ubuntu-srv-dio:/# useradd convidado1 -c "Convidado especial" -s /bin/bash -m -p $(openssl passwd senha123)

<br>
As vezes vejo nos fóruns o pessoal faz uma pergunta simples, em que a resposta deveria ser só uma linha de comando, duas no máximo, mas o pessoal "mais sênior" gosta de responder com scrits mirabolantes, muitas vezes já passando longo do nível de conhecimento de quem fez a pergunta. Não é menosprezar e superestimar, mas é começar pelo mais simples, aí se o usuário que perguntou estiver precisando de algo mais elaborado, aí sim partir para essas respostas com scritps cheios das firulas dos "do this" e "do that".

<br>
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

## Adicionando usuários a grupos

<br>
Ver os grupos existentes no sistema:

>   root@ubuntu-srv-dio:/# cat /etc/group

<br>
Adicionando um usuário a um ou mais grupos:

>   root@ubuntu-srv-dio:/# usermod -G adm,sudo barbara

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
Observação: ao utilizar o usermod -G, tenha em mente que o usuário será removido dos grupos anteriores. 
<br>
O mais correto é utilizar o parâmetro "-a", que adiciona o usuário aos demais grupos sem removê-lo dos grupos que já pertence:

> -a, --append
append the user to the supplemental GROUPS mentioned by the -G option without removing the user from other groups

>   root@ubuntu-srv-dio:/# usermod -a GRP_ADM,GRP_VEN barbara <br>
>   
>   root@ubuntu-srv-dio:/# cat /etc/group | grep barbara <br>
>   adm: x :4:syslog,marcio,barbara <br>
>   sudo: x :27:marcio,barbara <br>
>   barbara: x :1007: <br>
>   GRP_ADM: x :1008:rafaela,juliana,barbara <br>
>   GRP_VEN: x :1009:maria,joao,barbara <br>
   
<br>
Para remover o usuário de um grupo específico:

>   root@ubuntu-srv-dio:/# gpasswd -d barbara sudo <br>
>   Removing user barbara from group sudo <br>
>
>   root@ubuntu-srv-dio:/# cat /etc/group | grep barbara <br>
>   adm: x :4:syslog,marcio,barbara <br>
>   barbara: x :1007: <br>
>   GRP_ADM: x :1008:rafaela,juliana,barbara <br>
>   GRP_VEN: x :1009:maria,joao,barbara <br>

## Conhecendo o sistema de permissões

![Sistema de Permissões no Linux](sistema-de-permissoes.png)

![](chmod-permissoes-2-500x150.png)

![](perm.png)

>   root@ubuntu-srv-dio:/home# ls -l <br>
>   total 44 <br>
>   
>   drwxr-x--- 3 barbara barbara 4096 ago 18 15:26 barbara <br>
>   drwxr-x--- 2 guest   guest   4096 ago 18 10:25 guest <br>
>   drwxr-x--- 3 guest10 guest10 4096 ago 18 15:15 guest10 <br>
>   drwxr-x--- 2 guest11 guest11 4096 ago 18 14:53 guest11 <br>
>   drwxr-x--- 2 guest12 guest12 4096 ago 18 14:53 guest12 <br>
>   drwxr-x--- 2 guest13 guest13 4096 ago 18 14:53 guest13 <br>
>   drwxr-x--- 2 joao    joao    4096 ago 18 10:16 joao <br>
>   drwxr-x--- 2 juliana juliana 4096 ago 18 16:05 juliana <br>
>   drwxr-x--- 6 marcio  marcio  4096 ago 18 08:38 marcio <br>
>   drwxr-x--- 2 maria   maria   4096 ago 18 16:05 maria <br>
>   drwxr-x--- 2 rafaela rafaela 4096 ago 18 16:03 rafaela <br>
>   root@ubuntu-srv-dio:/home# <br>

**d rwx r-x ---**: Sistema de permissões <br>
d: Indica que se trata de um diretório <br>
rwx: Informações das permissões do dono <br>
r-x: Informações das permissões do grupo <br>
---: Informações das permissões de outros <br>

r : read - permissão de leirura <br>
w : write - permissão de escrita <br>
x : eXecute - permissão de execução <br>

<br>
Trocando o dono de um diretório

>   root@ubuntu-srv-dio:/# ls -lh <br>
>   total 2,9G <br>
>   d rwx r-x r-x   2 root root 4,0K ago 18 18:26 adm <br>
>
>   root@ubuntu-srv-dio:/# chown barbara:GRP_ADM /adm/ <br>
>   root@ubuntu-srv-dio:/# ls -lh <br>
>   total 2,9G <br>
>   d rwx r-x r-x   2 barbara GRP_ADM 4,0K ago 18 18:26 adm <br>

Agora a dona do diretório é a usuária barbara e o diretório pertence ao grupo GRP_ADM. Como podemos ver nas permissões, apenas barbara pode gravar no diretório, os demais usuários do grupo podem apenas ler e executar arquivos neste diretório, mas não podem fazer nenhuma alteração neles.

<br>
Outro exemplo:

>   root@ubuntu-srv-dio:/# chown maria:GRP_VEN /ven/ <br>
>   root@ubuntu-srv-dio:/# ls -lh <br>
>   total 2,9G <br>
>   drwxr-xr-x   2 maria   GRP_VEN 4,0K ago 18 >   18:27 ven <br>

Aqui a dona do diretório agora é maria, o diretório pertence ao grupo GRP_VEN, apenas maria pode gravar no diretório, os demais usuários do grupo podem apenas ler e executar arquivos neste diretório.

## Alterando as permissões de um diretório - arquivo

Agora vamos configurar permissões específicas para arquivos e pastas.

Podemos fazer fazer a alteração das permissões utilizando o sistema de valores numéricos:

|Permissão		|Valor	|
| :---: 		| :---: |
|               |       |
|Leitura (R)	|   4	|
|Gravação (W)	|   2	|
|Execução (X)	|   1	|
|Nenhuma		|   0	|

<br>
Vamos alterar as permissões de modo que outros usuários não tenham nenhum acesso ao diretório *adm*
Estado atual:

>   root@ubuntu-srv-dio:/# ls -lh <br>
>   drwxr-xr-x   2 barbara GRP_ADM 4,0K ago 18 18:26 adm <br>

>   root@ubuntu-srv-dio:/# chmod 750 /adm/ <br>

- Primeiro dígito: Dono
    - 7 --> 4(leitura)+2(gravação)+1(execução)
- Segundo dígito: usuários do Grupo
    - 5 --> 4(leitura)+1(execução)
- Terceiro dígito: Demais usuários
    - 0 --> nenhuma permissão

>   root@ubuntu-srv-dio:/# ls -lh <br>
>   total 2,9G <br>
>   drwxr-x---   2 barbara GRP_ADM 4,0K ago 18 18:26 adm <br>

<br>
Testando as permissões:

>   barbara@ubuntu-srv-dio:/adm$ nano texto-barbara.txt <br>
>   barbara@ubuntu-srv-dio:/adm$ ls -l <br>
>   total 4 <br>
>   -rw-rw-r-- 1 barbara barbara 47 ago 18 19:30 texto-barbara.txt <br>
Usuária barbara, como proprietária do diretório, consegue gravar arquivos e realizar alterações neles.

>   barbara@ubuntu-srv-dio:/adm$ su rafaela <br>
>   Password: <br>
>   rafaela@ubuntu-srv-dio:/adm$ ls <br>
>   texto-barbara.txt <br>
>   rafaela@ubuntu-srv-dio:/adm$ nano texto-barbara.txt <br>
A usuária rafaela pertence ao grupo GRP_ADM assim como a barbara, portanto, consegue listar, e abrir o arquivo.

>   rafaela@ubuntu-srv-dio:/adm$ su maria <br>
>   Password: <br>
>   maria@ubuntu-srv-dio:/adm$ ls <br>
>   ls: cannot open directory '.': Permission denied <br>
>   maria@ubuntu-srv-dio:/adm$ <br>
A usuária maria pertende ao grupo GRP_VEN, portanto não pode ver nem mesmo o conteúdo da pasta _adm_

<br>
Vamos fazer uma alteração apenas nas permissões da pasta _ven_ para que os usuários pertencentes ao grupo possam também gravar (w):

Atual:
>   root@ubuntu-srv-dio:/# ls -lh <br>
>   drwxr-xr-x   2 maria   GRP_VEN 4,0K ago 18 18:27 ven <br>

<br>
Alteração:

>   root@ubuntu-srv-dio:/# chmod 775 /ven/ <br>
>   root@ubuntu-srv-dio:/# ls -lh <br>
>   drwxrwxr-x   2 maria   GRP_VEN 4,0K ago 18 18:27 ven <br>

<br>
Recapitulando:


|1º dígito: |2º dígito: |3º dígito: |
|:---: |:---: |:---: |
|Dono |Usuários do grupo |Demais usuários |
| 7	| 7	| 5	|
| 4(leitura)+<br>2(gravação)+<br>1(execução) | 4(leitura)+<br>2(gravação)+<br>1(execução) | 4(leitura)+<br>1(execução) |
| rwx | rwx | r-x |

## Entendendo melhor as permissões de execução para scripts

