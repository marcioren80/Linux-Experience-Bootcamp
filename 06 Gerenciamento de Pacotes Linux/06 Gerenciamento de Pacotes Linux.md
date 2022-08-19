# Gerenciamento de Pacotes Linux

## Gerenciamento de pacotes (UBUNTU-DEBIAN)

O que é um pacote?

Pode ser um software, um driver ou codec de áudio e vídeo.

<br>
O apt-get é um gerenciador de baixo nível, isso significa que  para se instalar algo, você precisa saber extamente o nome do pacote que quer instalar.

>	root@ubuntu-srv-dio:/# apt-get --help
>	apt 2.4.7 (amd64)
>	Usage: apt-get [options] command
>	&nbsp;&nbsp;&nbsp;&nbsp; apt-get [options] install|remove pkg1 [pkg2 ...]
>	&nbsp;&nbsp;&nbsp;&nbsp; apt-get [options] source pkg1 [pkg2 ...]
>	
>	apt-get is a command line interface for retrieval of packages
>	and information about them from authenticated sources and
>	for installation, upgrade and removal of packages together
>	with their dependencies.
>	
>	Most used commands:
>	 &nbsp;&nbsp;&nbsp;&nbsp; *update - Obter novas listas de pacotes*
>	 &nbsp;&nbsp;&nbsp;&nbsp; *upgrade - Executar uma actualização*
>	 &nbsp;&nbsp;&nbsp;&nbsp; *install - Instalar novos pacotes (o pacote é libc6 e não libc6.deb)*
>	 &nbsp;&nbsp;&nbsp;&nbsp; reinstall - Reinstall packages (pkg is libc6 not libc6.deb)
>	 &nbsp;&nbsp;&nbsp;&nbsp; remove - Remover pacotes
>	 &nbsp;&nbsp;&nbsp;&nbsp; *purge - Remover pacotes e ficheiros de configuração*
>	 &nbsp;&nbsp;&nbsp;&nbsp; autoremove - Remover automaticamente todos os pacotes não utilizados
>	 &nbsp;&nbsp;&nbsp;&nbsp; dist-upgrade - Actualizar a distribuição, veja apt-get(8)
>	 &nbsp;&nbsp;&nbsp;&nbsp; dselect-upgrade - Seguir as escolhas feitas no dselect
>	 &nbsp;&nbsp;&nbsp;&nbsp; build-dep - Configurar as dependências de compilação de pacotes de códigofonte
>	 &nbsp;&nbsp;&nbsp;&nbsp; satisfy - Satisfy dependency strings
>	 &nbsp;&nbsp;&nbsp;&nbsp; clean - Apagar ficheiros de arquivo obtidos por download
>	 &nbsp;&nbsp;&nbsp;&nbsp; autoclean - Apagar ficheiros de arquivo antigos obtidos por download
>	 &nbsp;&nbsp;&nbsp;&nbsp; check - Verificar se existem dependências erradas
>	 &nbsp;&nbsp;&nbsp;&nbsp; source - Fazer o download de arquivos de código-fonte
>	 &nbsp;&nbsp;&nbsp;&nbsp; download - Obter o pacote binário para o directório actual
>	 &nbsp;&nbsp;&nbsp;&nbsp; changelog - Obter e mostrar o changelog de um pacote
>	
>	See apt-get(8) for more information about the available commands.
>	Configuration options and syntax is detailed in apt.conf(5).
>	Information about how to configure sources can be found in sources.list(5).
>	Package and version choices can be expressed via apt_preferences(5).
>	Security details are available in apt-secure(8).
>	Este APT tem Poderes de Super Vaca.
>	root@ubuntu-srv-dio:/#

