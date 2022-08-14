# Manipulando Arquivos no Linux
## Terminal Linux - Apresentação

usuário@nomemaquina:~\$<br>
**usuário**: Nome do usuário atualmente logado no terminal.<br>
**@nomemaquina**: Nome da máquina em que se está logado.<br>
**\~$**: Indica o local/pasta onde o usuário está no momento. O "~" signigica que a pasta atual é a **/home/usuário**.<br>

Os comandos do Linux são Case Sensitive, o que significa que você deve respeitar o uso de letras MAIÚSCULAS e minúsculas.


## Navegando pelo sistema de arquivos

pwd: Comando exibe na tela a pasta atual.
>    marcio@ubuntu-srv-dio:~\$ pwd <br>
>    /home/marcio <br>
>    marcio@ubuntu-srv-dio:~\$

<br>

cd: usado para mudar de diretório (**c**hange **d**irectory) <br>
 >   marcio@ubuntu-srv-dio:~\$ cd / <br>
 >   marcio@ubuntu-srv-dio:/\$


<br>

ls: Lista os arquivos e pastas do diretório.
>    marcio@ubuntu-srv-dio:/\$ ls /var <br>
>    backups  cache  crash  lib  local  lock  >log  mail  opt  run  snap  spool  tmp <br>
>    marcio@ubuntu-srv-dio:/\$

<br>

Podemos listar arquivos de diferentes diretórios sem precisar sair do diretório atual: <br>
>   marcio@ubuntu-srv-dio:/\$ ls /var <br>
>   backups  cache  crash  lib  local  lock  > log  mail  opt  run  snap  spool  tmp <br>
>   marcio@ubuntu-srv-dio:/\$


<br>

Retornar um nível de pasta: <br>
>   marcio@ubuntu-srv-dio:/var/log$ cd .. <br>
>   marcio@ubuntu-srv-dio:/var$

<br>

## Filtrando a exibição de arquivos

Para listar arquivos e pastas de um diretório de forma paginada:
> marcio@ubuntu-srv-dio:/etc$ ls | more

<br>

Listar arquivos por nome ou parte do nome:
>   marcio@ubuntu-srv-dio:/etc$ ls ss* <br>
>   ssh: <br>
>   moduli        sshd_config       ssh_host_dsa_key.pub    ssh_host_ed25519_key      ssh_host_rsa_key.pub <br>
>   ssh_config    sshd_config.d     ssh_host_ecdsa_key      ssh_host_ed25519_key.pub  ssh_import_id <br>
>   ssh_config.d  ssh_host_dsa_key  ssh_host_ecdsa_key.pub  ssh_host_rsa_key <br>
>    <br>
>   ssl: <br>
>   certs  openssl.cnf  private <br>
>   marcio@ubuntu-srv-dio:/etc$

<br>

Caracteres curinga nas pesquisas:
>   marcio@ubuntu-srv-dio:/etc$ ls m?g* <br>
>   magic  magic.mime <br>
>   marcio@ubuntu-srv-dio:/etc$

>   marcio@ubuntu-srv-dio:/etc$ ls g?o* <br>
>   group  group-
>   
>   groff: <br>
>   man.local  mdoc.local <br>
>   marcio@ubuntu-srv-dio:/etc$

<br>

Os Filtros de Exclusão podem ser usados para criar, listar ou excluir arquivos e pastas: <br>
>   marcio@ubuntu-srv-dio:~\$ ls <br>
>   arquivo1.txt  arquivo2.txt  arquivo3.txt  >   arquivo4.txt  arquivo5.txt  workspace <br>

>   marcio@ubuntu-srv-dio:~\$ ls arquivo[1-3]* <br>
>   arquivo1.txt  arquivo2.txt  arquivo3.txt <br>

>   marcio@ubuntu-srv-dio:~\$ ls arquivo[2,5]* <br>
>   arquivo2.txt  arquivo5.txt <br>

>   marcio@ubuntu-srv-dio:~\$ ls arquivo[^2,5]* <br>
>   arquivo1.txt  arquivo3.txt  arquivo4.txt <br>

>   marcio@ubuntu-srv-dio:~\$ ls arquivo[^3-5]* <br>
>   arquivo1.txt  arquivo2.txt <br>

 <br>

Exemplo removendo arquivos: <br>
>   marcio@ubuntu-srv-dio:~\$ ls arquivo[^3-5]* <br>
>   arquivo1.txt  arquivo2.txt <br>
>   marcio@ubuntu-srv-dio:~\$ rm arquivo[^3-5]* <br>
>   marcio@ubuntu-srv-dio:~\$ ls <br>
>   arquivo3.txt  arquivo4.txt  arquivo5.txt  workspace <br>
>   marcio@ubuntu-srv-dio:~\$