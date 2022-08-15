# Manipulando Arquivos no Linux
## Terminal Linux - Apresentação

usuário@nomemaquina:\~\$<br>
**usuário**: Nome do usuário atualmente logado no terminal.<br>
**@nomemaquina**: Nome da máquina em que se está logado.<br>
**\~$**: Indica o local/pasta onde o usuário está no momento. O "\~" signigica que a pasta atual é a **/home/usuário**.<br>

Os comandos do Linux são Case Sensitive, o que significa que você deve respeitar o uso de letras MAIÚSCULAS e minúsculas.

## Navegando pelo sistema de arquivos

<br>
pwd: Comando exibe na tela a pasta atual.

>    marcio@ubuntu-srv-dio:\~\$ pwd <br>
>    /home/marcio <br>
>    marcio@ubuntu-srv-dio:\~\$

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
Retornar um nível de pasta: <br>

>   marcio@ubuntu-srv-dio:/var/log$ cd .. <br>
>   marcio@ubuntu-srv-dio:/var$

## Filtrando a exibição de arquivos
<br>
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

>   marcio@ubuntu-srv-dio:\~\$ ls arquivo[^3-5]* <br>
>   arquivo1.txt  arquivo2.txt <br>
>   marcio@ubuntu-srv-dio:\~\$ rm arquivo[^3-5]* <br>
>   marcio@ubuntu-srv-dio:\~\$ ls <br>
>   arquivo3.txt  arquivo4.txt  arquivo5.txt  workspace <br>
>   marcio@ubuntu-srv-dio:\~\$

## Localizando arquivos

<br>
Podemos listar arquivos de diferentes diretórios sem precisar sair do diretório atual: <br>

>   marcio@ubuntu-srv-dio:/\$ ls /var <br>
>   backups  cache  crash  lib  local  lock  > log  mail  opt  run  snap  spool  tmp <br>
>   marcio@ubuntu-srv-dio:/\$

<br>
Neste exemplo, ele mostra os arquivos e pastas que iniciam com a letra "s" e exibe o conteúdo do diretório que inicia com "s".

>   marcio@ubuntu-srv-dio:~\$ ls /sys/kernel/s* <br>
>   /sys/kernel/security: <br>
>   apparmor  evm  ima  integrity  lockdown  lsm <br>

<br>
Fazendo uma busca pelo nome do arquivo com find: <br>

>   marcio@ubuntu-srv-dio:/home\$ find -name arq* <br>
>   ./marcio/arquivo5.txt <br>
>   ./marcio/arquivo3.txt <br>
>   ./marcio/arquivo4.txt <br>
>   marcio@ubuntu-srv-dio:/home$ <br>

## Criando diretórios

<br>
O comando para criar diretórios é o **mkdir**:

>   marcio@ubuntu-srv-dio:\~\$ mkdir Documentos <br>
>   marcio@ubuntu-srv-dio:\~\$ ls <br>
>   arquivo3.txt  arquivo4.txt  arquivo5.txt  Documentos  workspace <br>
>   marcio@ubuntu-srv-dio:~\$ <br>

>   marcio@ubuntu-srv-dio:\~\$ mkdir Planilhas <br>
>   marcio@ubuntu-srv-dio:\~\$ cd Planilhas/ <br>
>   marcio@ubuntu-srv-dio:\~/Planilhas$ mkdir Financeiras <br>
>   marcio@ubuntu-srv-dio:\~/Planilhas$ mkdir Escolares <br>
>   marcio@ubuntu-srv-dio:\~/Planilhas$ ls <br>
>   Escolares       Financeiras <br>
>   marcio@ubuntu-srv-dio:~/Planilhas$ <br>

<br>
Se for necessário criar uma pasta com nome que tenha espaço, utilize o nome entre aspas simples:

>   marcio@ubuntu-srv-dio:\~\$ mkdir 'Meus Documentos' <br>
>   marcio@ubuntu-srv-dio:\~\$ ls <br>
>   arquivo3.txt   arquivo4.txt   arquivo5.txt   Documentos  'Meus Documentos'   Planilhas   workspace <br>
>   marcio@ubuntu-srv-dio:\~\$ <br>

## Excluindo arquivos e diretórios

<br>
O comando para excluir diretórios é o **rmdir**

>   marcio@ubuntu-srv-dio:\~\$ rmdir 'Meus Documentos'/ <br>
>   marcio@ubuntu-srv-dio:~$

Obs1: a pasta não será excluída se houver arquivos dentro. <br>
Obs2: O LINUX NÃO PERGUNTA SE VOCÊ TEM CERTEZA QUE DESEJA EXCLUIR, ELE APAGA E PRONTO, ENTÃO TENHA CUIDADO!

<br>
O Linux reclama se você tentar apagar um diretório com arquivos dentro:

>   marcio@ubuntu-srv-dio:\~\$ rmdir Documentos/ <br>
>   rmdir: failed to remove 'Documentos/': Directory not empty <br>
>   marcio@ubuntu-srv-dio:~$

<br>
Sendo assim, utilize:

>   marcio@ubuntu-srv-dio:\~\$ **rm -rf** Documentos/ <br>
>   marcio@ubuntu-srv-dio:\~\$ ls <br>
>   arquivo3.txt  arquivo4.txt  arquivo5.txt  Planilhas  workspace <br>
>   marcio@ubuntu-srv-dio:\~$

O comando **rm** é o mesmo para apagar arquivos, ou seja, mais útil que o rmdir que só apaga pastas vazias.

## Obtendo ajuda

<br>
O Linux possui um manual imbutido para seus comandos, basta utilizar --help após o comando, por exemplo: <br>

> marcio@ubuntu-srv-dio:~\$ ls --help <br>
> Usage: ls [OPTION]... [FILE]... <br>
> List information about the FILEs (the current directory by default). <br>
> Sort entries alphabetically if none of -cftuvSUX nor --sort is specified. <br>
> Mandatory arguments to long options are mandatory for short options too. <br>
>   -a, --all                  do not ignore entries starting with . <br>
>   -A, --almost-all           do not list implied . and .. <br>
>       --author               with -l, print the author of each file <br>
>   -b, --escape               print C-style escapes for nongraphic characters <br>

<br>
O comando _man_ também vai exibir um texto com o uso do comando: <br>

> marcio@ubuntu-srv-dio:\~\$ man rmdir <br>
> marcio@ubuntu-srv-dio:~\$ man rm <br>

<br>
Visite também: https://help.ubuntu.com/

## Executando tarefas administrativas como root

<br>
Para realizar tarefas de administrador o usuário atual precisa estar nos grupos *adm* e *sudo*.
Ver usuários e grupos:<br>

> \$ cat /etc/group

<br>
Para executar um comando administrativo como criar uma pasta ou arquivo dentro de uma pasta do sistema:

> marcio@ubuntu-srv-dio:/\$ mkdir Aula <br>
> mkdir: cannot create directory ‘Aula’: Permission denied <br>
> marcio@ubuntu-srv-dio:/\$ **sudo** mkdir Aula <br>
> [sudo] password for marcio: <br>

<br>
O diretório criado foi adicionado com o proprietário "root", sendo assim, só podemos criar arquivos e mais pastas dentro dele se utilizarmos "sudo". <br>

> marcio@ubuntu-srv-dio:/$ ll -lh <br>
> total 2,9G <br>
> drwxr-xr-x  20 root root 4,0K ago 14 17:51 ./ <br>
> drwxr-xr-x  20 root root 4,0K ago 14 17:51 ../ <br>
> drwxr-xr-x   2 root root 4,0K ago 14 17:51 **Aula**/ <br>

## Logando como usuário root
<br>
NÃO É RECOMENDADO POR QUESTÃO DE BOAS PRÁTICAS DE ADMINISTRAÇÃO E SEGURANÇA, mas podemos utilizar o usuário root para realizar tarefas administrativas sem precisar ficar digitando a senha toda hora.<br>
Para isso, primeiro vamos definir uma senha diferente para o usuário root: <br>

>   marcio@ubuntu-srv-dio:\~\$ sudo passwd root <br>
>   [sudo] password for marcio: *<senha do usuário logado>* <br>
>   New password: *<nova senha para o usuário root>* <br>
>   Retype new password: *<repetir a nova senha para o usuário root>* <br>
>   passwd: password updated successfully <br>
>   marcio@ubuntu-srv-dio:~$ <br>

<br>
Para alternar para o usuário root:

>   marcio@ubuntu-srv-dio:~$ su <br>
>   Password: <br>
>   root@ubuntu-srv-dio:/home/marcio# <br>

<br>
Voltar para o usuário anterior ou outro usuário:

> **root**@ubuntu-srv-dio:/home/marcio# su marcio <br>
> **marcio**@ubuntu-srv-dio:~$

Repare também na alteração no prompt de **"#"** de volta para **"$"**.

## Liberando acesso remoto do usuário root

<br>
Para conseguirmos realizar um acesso remoto ssh diretamente com o usuário root, vamos precisar alterar algumas informações no serviço sshd, que é o serviço responsável pelo acesso ssh.<br>

>   marcio@ubuntu-srv-dio:\~\$ sudo nano /etc/ssh/sshd_config <br>
>   [sudo] password for marcio: <br>

<br>
Descomentar e Alterar a linha abaixo: <br>
de:

- \# PermitRootLogin prohibit-password <br>
para:  <br>
- PermitRootLogin yes <br>

<br>
Salva e reinicia o serviço sshd: 

> marcio@ubuntu-srv-dio:~$ sudo systemctl restart sshd

## Trabalhando com arquivos de texto

<br>
O VI é um editor de texto rudimentar e básico para edição de texto no Linux Server. Ao abrir, para começara escrever nele entre no modo "Inserção" digitando a letra "i". Para sair do modo de inserção tecle Esc, e para salvar e sair ":wq".<br>
Neste curso utilizaremos o NANO, que é um editor um pouco mais "user friendly" que o VI.

<br>
Comandos básicos do NANO: <br>

- Ctrl+S = Salva.
- Ctrl+O = Salva com opção de altera o nome do arquivo.
- Ctrl+X = Sair do Nano.
- Ctrl+K = Recorta
- Ctrl+U = Cola

## Histórico de comandos

<br>
Listar os últimos 1000 comandos utilizados pelo usuário. <br>

> $ history

<br>
Listar apenas os últimos 30 comandos:

> $ history 30

<br>
Listar historico relacionado a uma palavra:

> marcio@ubuntu-srv-dio:\~\$ history | grep "Planilhas" <br>
>   713  mkdir Planilhas <br>
>   714  cd Planilhas/ <br>
>   736  cd Planilhas/ <br>
>   741  rm -rf Planilhas/ <br>
>   775  history | grep "Planilhas" <br>
> marcio@ubuntu-srv-dio:\~$ <br>

<br>
Muito interessante, caso tenha a necessidade, é possível colocar data e hora na saída do histórico de comandos:

>	marcio@ubuntu-srv-dio:\~\$ export HISTTIMEFORMAT="%c " <br>
>	marcio@ubuntu-srv-dio:\~\$ history 5 <br>
>	  **773  dom 14 ago 2022 19:49:03** logout <br>
>	  **774  dom 14 ago 2022 19:49:03** exit <br>
>	  **775  dom 14 ago 2022 19:49:06** history | grep "Planilhas" <br>
>	  **776  dom 14 ago 2022 21:11:19** export HISTTIMEFORMAT="%c " <br>
>	  **777  dom 14 ago 2022 21:11:44** history 5 <br>
>	marcio@ubuntu-srv-dio:\~\$ <br>

<br>
Para impedir que os comandos apareçam no *history*:

>	marcio@ubuntu-srv-dio:~$ set +o history

<br>
Limpar o histórico de comandos:

>   marcio@ubuntu-srv-dio:~$ history -c

<br>
Aumentar ou diminuir a quantidade de linhas de comandos salvas no history (config por usuário):

>   marcio@ubuntu-srv-dio:~$ nano .bashrc <br>
>   \# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) <br>
>   HISTSIZE=1000 <<<< Altera o valor para mais ou para menos. <br>
>   HISTFILESIZE=2000 <<<<< Tamanho máximo do arquivo em bytes. <br>

