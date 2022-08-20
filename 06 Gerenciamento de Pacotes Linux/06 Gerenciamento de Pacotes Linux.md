# Gerenciamento de Pacotes Linux

## Gerenciamento de pacotes (UBUNTU-DEBIAN)

O que é um pacote?

Pode ser um software, um driver ou codec de áudio e vídeo. 

<br>
O **apt-get** é um gerenciador de baixo nível, isso significa que  para se instalar algo, você precisa saber extamente o nome do pacote que quer instalar.

>	root@ubuntu-srv-dio:/# apt-get --help <br>
>	apt 2.4.7 (amd64) <br>
>	Usage: apt-get [options] command <br>
>	&nbsp;&nbsp;&nbsp;&nbsp; apt-get [options] install|remove pkg1 [pkg2 ...] <br>
>	&nbsp;&nbsp;&nbsp;&nbsp; apt-get [options] source pkg1 [pkg2 ...] <br>
>	
>	apt-get is a command line interface for retrieval of packages <br>
>	and information about them from authenticated sources and <br>
>	for installation, upgrade and removal of packages together <br>
>	with their dependencies.
>	
>	Most used commands: <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; *update - Obter novas listas de pacotes* <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; *upgrade - Executar uma actualização* <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; *install - Instalar novos pacotes (o pacote é libc6 e não libc6.deb)* <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; reinstall - Reinstall packages (pkg is libc6 not libc6.deb) <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; remove - Remover pacotes <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; *purge - Remover pacotes e ficheiros de configuração* <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; autoremove - Remover automaticamente todos os pacotes não utilizados <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; dist-upgrade - Actualizar a distribuição, veja apt-get(8) <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; dselect-upgrade - Seguir as escolhas feitas no dselect <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; build-dep - Configurar as dependências de compilação de pacotes de códigofonte <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; satisfy - Satisfy dependency strings <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; clean - Apagar ficheiros de arquivo obtidos por download <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; autoclean - Apagar ficheiros de arquivo antigos obtidos por download <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; check - Verificar se existem dependências erradas <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; source - Fazer o download de arquivos de código-fonte <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; download - Obter o pacote binário para o directório actual <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; changelog - Obter e mostrar o changelog de um pacote <br>
>	
>	See apt-get(8) for more information about the available commands. <br>
>	Configuration options and syntax is detailed in apt.conf(5). <br>
>	Information about how to configure sources can be found in sources.list(5). <br>
>	Package and version choices can be expressed via apt_preferences(5). <br>
>	Security details are available in apt-secure(8). <br>
>	Este APT tem Poderes de Super Vaca. <br>
>	root@ubuntu-srv-dio:/# <br>

<br>
Temos também o **apt**, que é uma atualização do apt-get e possui os seguintes recursos:

>	root@ubuntu-srv-dio:/# apt --help <br>
>	apt 2.4.7 (amd64) <br>
>	Usage: apt [options] command <br>
>	
>	apt is a commandline package manager and provides commands for <br>
>	searching and managing as well as querying information about packages. <br>
>	It provides the same functionality as the specialized APT tools, <br>
>	like apt-get and apt-cache, but enables options more suitable for <br>
>	interactive use by default. <br>
>	
>	Most used commands: <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  *list - list packages based on package names* <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  *search - search in package descriptions* <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  show - show package details <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  install - install packages <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  reinstall - reinstall packages <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  remove - remove packages <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  autoremove - Remover automaticamente todos os pacotes não utilizados <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  update - update list of available packages <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  upgrade - upgrade the system by installing/upgrading packages <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  full-upgrade - upgrade the system by removing/installing/upgrading packages <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  edit-sources - edit the source information file <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp;  satisfy - satisfy dependency strings <br>
>	
>	See apt(8) for more information about the available commands. <br> 
>	Configuration options and syntax is detailed in apt.conf(5). <br>
>	Information about how to configure sources can be found in sources.list(5). <br>
>	Package and version choices can be expressed via apt_preferences(5). <br>
>	Security details are available in apt-secure(8). <br>
>	Este APT tem Poderes de Super Vaca. <br>
>	root@ubuntu-srv-dio:/# <br>

<br>
Verificar os pacotes instalados atualmente:

>   root@ubuntu-srv-dio:/# apt list --installed

<br>
Verificar se um pocte específico está instalado:

>   root@ubuntu-srv-dio:/# apt list --installed | grep nano <br>
>   nano/jammy,now 6.2-1 amd64 [installed,automatic]

<br>
Lista de pacotes atualizáveis:

>   root@ubuntu-srv-dio:/# apt list --upgradable

<br>
Buscar pacotes por nome:

>   root@ubuntu-srv-dio:/# apt search samba

<br>
Caso tenha a necessidade de instalar um paocte que esteja em um novo repositório ainda não disponível, pode-se adicionar este novo repositório no arquivo:

>   root@ubuntu-srv-dio:/Downloads# apt edit-sources

<br>

## Atualização dos aplicativos do sistema operacional

<br>
Lembre-se sempre de efetuar o backup/snapshot antes de executar atualizações de sistema, seja Linux ou Windows. No nosso servidor o update é feito das maneira abaixo:

> Primeiro, atualizar a lista de pacotes disponíveis: <br>
> root@ubuntu-srv-dio:/# apt update <br>
> &nbsp;&nbsp;&nbsp;&nbsp;  apt update - update list of available packages <br>
>
> Em seguida, fazer a atualização de fato: <br>
> root@ubuntu-srv-dio:/# apt upgrade <br>
> &nbsp;&nbsp;&nbsp;&nbsp; apt upgrade - upgrade the system by installing/upgrading packages <br>

<br>
Para realizar a atualização da versão do Ubuntu istalado:

>	root@ubuntu-srv-dio:/# apt-get dist-upgrade <br>
>	 &nbsp;&nbsp;&nbsp;&nbsp; dist-upgrade - Actualizar a distribuição, veja apt-get(8) <br>

<br>

## Instalação de pacotes no ambiente Desktop

<br>
No ambiente desktop Ubuntu, temos a loja de aplicativos, semelhante a loja de aplicativos do Windows:

<img src="loja-ubuntu-software-01.png" width="640" height="480">

<br>
Para Instalar um aplicativo, basta pesquisar o aplicativo desejado:

<img src="loja-ubuntu-software-02.png" width="640" height="480">

<br>
E clicar em instalar:

<img src="loja-ubuntu-software-03.png" width="640" height="480">

<br>
Mas claro, também é possivel realizar a instalação através do nosso bom e velho terminal, a diferença é que via terminal podemos ver todas as dependências que serão instaladas junto com o pacote principal:

<img src="apt-install-desk-term-01.png" width="820" height="230"> <br>
<img src="apt-install-desk-term-02.png" width="820" height="230">

<br>

## Gerenciamento de pacotes (FEDORA / RED HAT (RHEL) / CenTOS)

<br>
Nos sistemas RedHat based, existem dois genreciadores de pacotes:

>	#dnf <br>
>	&nbsp;&nbsp; (mais "user friendly")<br>
>	ou o <br>
>	#yum<br>
>	&nbsp;&nbsp; (mais utilizado em scripts)

<br>
Exemplo dnf:

>	#dnf search net-tools <br>
>	#dnf install net-tools -y <br>
>	#dnf remove net-tools <br>

 <br>
Exemplo yum:

>   #yum install httpd

ATENÇÃO: <br>
O **dnf update** não precisa atualizar os repositórios antes.

<br>

## Realizando a instalação de arquivos DEB

<br>
Diferente dos executáveis do Windows que tem como extensão .exe e .msi para instaladores de arquivos, no Linux temos as extensões .deb para sistemas Debian based e a extensão .rpm para RedHat based. <br>
<br>
Esses aplicativos podem ser instalados também via terminal ou duplo clique.

<img src="deb-install-desk-term-01.png" width="460" height="225"> <br>

Instalação via terminal: <br>
<img src="deb-install-desk-term-02.2.png" width="750" height="480"> <br>

Instalação padrão windows: <br>
<img src="deb-install-desk-term-03.png" width="640" height="480"> <br>
<img src="deb-install-desk-term-04.png" width="640" height="480"> <br>

Diferente da instalação via terminal, o usuário não vê a instalação dos pacotes adicionais de dependência, apenas a porcentagem do progresso da instalação: <br>
<img src="deb-install-desk-term-05.png" width="640" height="480"> <br>