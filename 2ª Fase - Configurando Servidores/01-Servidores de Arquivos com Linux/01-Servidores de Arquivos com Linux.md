# Servidores de Arquivos com Linux

## Introdução ao servidor de arquivos

No dia-a-dia em uma empresa pode ser necessário que os usuários compartilhem arquivos uns com os outros, para que estes arquivos não fiquem todos salvos localmente na máquina de cada usuário, podemos criar um **servidor de arquivos**.

Para isso, vamos usar um protocolo chamado SMB configurado através da aplicação SAMBA.

Em um servidor centralizado, podemos definir permissões de acessos e até mesmo os tipos de arquivos que podem ser salvos, limitando o uso indevido de armazenamento de arquivos que não fazem parte do escopo da empresa ou departamento.


## Instalação do SAMBA e configuração inicial

Vamos lá....

Visite <http://www.wiki.samba.org>

<br>
Instalando o *samba*:

> apt install samba

<br>
Após a instalação, vamos utilizar um um disco diferente do disco de sistema para criar o local onde as pastas compartilhadas serão gravadas.

> cd /disco2 <br>
> mkdir publica

<br>
Para a pasta *publica*, vamos dar as permissões para todos acessarem:

> chmod 777 publica/

O arquivo de configuração do SAMBA fica em /etc/samba/smb.conf. Antes de abrir e de fazer qualquer alteração, salve um backup.

<br>
Adicione no final do arquivo:

> #Nome do compartilhamento: <br>
> [publica] <br>
> path = /disco2/publica <br>
> writeable = yes <br>
> guest ok = yes <br>

<br>
Salva e reinicia o serviço smb:

> systemctl restart smbd

<br>
Ver se o serviço está ativo:

> systemctl status smbd

<br>
Para o serviço smbd iniciar junto com o sistema:

> systemctl enable smbd

<br>

## Configurando o acesso via máquina cliente

No Windows podemos usar o "Mapear unidade de rede":

    \\ip-remoto\nome-compartilhamento

