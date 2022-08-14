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

cd: usado para mudar de diretório (**c**hange **d**irectory) <br>
 >   marcio@ubuntu-srv-dio:~\$ cd / <br>
 >   marcio@ubuntu-srv-dio:/\$

ls: Lista os arquivos e pastas do diretório.
>    marcio@ubuntu-srv-dio:/\$ ls /var <br>
>    backups  cache  crash  lib  local  lock  >log  mail  opt  run  snap  spool  tmp <br>
>    marcio@ubuntu-srv-dio:/\$

Podemos listar arquivos de diferentes diretórios sem precisar sair do diretório atual: <br>
>   marcio@ubuntu-srv-dio:/\$ ls /var <br>
>   backups  cache  crash  lib  local  lock  > log  mail  opt  run  snap  spool  tmp <br>
>   marcio@ubuntu-srv-dio:/\$

Retornar um nível de pasta: <br>
>   marcio@ubuntu-srv-dio:/var/log$ cd .. <br>
>   marcio@ubuntu-srv-dio:/var$

## Filtrando a exibição de arquivos

