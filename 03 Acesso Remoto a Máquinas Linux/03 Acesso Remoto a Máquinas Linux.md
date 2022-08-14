# Acesso Remoto a Máquinas Linux

### Acesso remoto via Windows

Como podemos realizar o acesso remoto ao nosso servidor?<br>
Vamos verificar primeiro o IP da Máquina:<br>
**$ip a**

    marcio@ubuntu-srv-dio:~$ ip -c a  
    2: ens32: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP    group default qlen 1000
        link/ether 00:0c:29:81:a4:6f brd ff:ff:ff:ff:ff:ff
        altname enp2s0
        inet 192.168.20.200/24 metric 100 brd 192.168.20.255 scope global ens32
           valid_lft forever preferred_lft forever
        inet6 fe80::20c:29ff:fe81:a46f/64 scope link
           valid_lft forever preferred_lft forever
    marcio@ubuntu-srv-dio:~$


Instale o serviço SSH no nosso servidor:<br>
$ sudo apt install openssh-server

Escolha o aplicativo de acesso SSH de sua preferência (Putty, MoBa, Zoc, etc) e acesse pelo IP.

### Acesso remoto via Linux

Se precisar acessar um servidor Linux remotamente, o terminal CLI do Ubuntu já possui o serviço SSH, não sendo necessária a intalação de nenhum outro recurso a não ser que o usuário queira.

### Acessando uma máquina virtual em nuvem (Putty)

Iniciando a máquina que foi criada na AWS, localize o IP público que foi designado.
Convertendo o arquivo "pem" para o formato "ppk":
- Abra o PuttyGen >> Load >> Selecione o arquivo .pem baixado da AWS >> Save Private Key >> Salvar.
- No Putty, vá em Connection >> Auth >> em Browse, selecione o arquivo ppk gerado.
- Em Session, coloque o IP da Máquina virtual AWS em Host Name.
- Conecte-se. 

A máquina da AWS não vai pedir senha e vai entrar com usuário padrão "ubuntu".
### Acessando uma máquina virtual em nuvem (ssh)

Abra o terminal do linux na pasta onde baixou o certificado .pem:

$ sudo chmod 600 ubuntu-aws.pem

$ ssh -i ubuntu-aws.pem ubuntu@12.123.123.123  

### Excluindo uma instância na AWS

No Painel de Controle da AWS, selecione a instância em execução, clicar em Estado da Instânica, Encerrar Instância. Isso excluirá sua máquina virtual.