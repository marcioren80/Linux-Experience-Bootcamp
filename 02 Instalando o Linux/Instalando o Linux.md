## Distribuições utilizadas no curso

![Tux, the Linux mascot](/png-transparent-tux-linux-vector-penguin-thumbnail.png)

### Baixando a ISO

Será utilizado inicialmente o [Ubuntu Server](https://ubuntu.com/download/server) <br>
Selecionar a opção Instalação Manual (Opção 2).

### Baixando o VirtualBox
Virtualbox: https://www.virtualbox.org/<br>
Link direto para [Windows hosts](https://download.virtualbox.org/virtualbox/6.1.36/VirtualBox-6.1.36-152435-Win.exe)<br>
Link direto para [Linux hosts](https://www.virtualbox.org/wiki/Linux_Downloads)<br>

As máquinas virtuais são computadores de software com a mesma funcionalidade que os computadores físicos. Assim como os computadores físicos, elas executam aplicativos e um sistema operacional. No entanto, as máquinas virtuais são arquivos de computador executados em um computador físico e se comportam como um computador físico.

### Instalando o VirtualBox
Baixado o instalador no Windows (.exe), next, next, next.

### Criando Máquinas Virtuais
Verifique se a virtualização está ativa:<br>
Abra o prompt do DOS no modo Administrador e execute o comando “bcdedit”<br>
Verifique o item _hypervisorlaunchtype_ se está com status “off”; caso não esteja execute o seguinte:

bcdedit /set hypervisorlaunchtype off

Inicialmente, será criada uma VM com 512MB de RAM, disco de 20GB de espaço dinamicamente alocado, Rede configurada como Modo Bridge.

### Instalando o Linux Ubuntu Server em MV: 
- Selecione Idioma: Português.
  - Layout: Português Brasil.
  - Variante: Português Brasil.
- Rede: Não há necessidade de mexer agora.
- Proxy address: A VM vai usar a rede que selecionamos no modo Bridge.
- Storage Configuration: Deixar como está.
- Configurações do Perfil: 
  - Seu Nome: Márcio Renato
  - Server's name (hostname): dio-linux-bootcamp
  - Nome de usuário: marcio
  - Senha de logon:
  - Confirmar senha:
- Install OpenSSH server: Não marcar, instalar depois manualmente.
- Instalação de serviços extras: não marcar nenhum.
- Prossegue com a instalação e finaliza.
 
Após o primeiro logon e utilização, para desligar a VM, podemos utilizar:

#shutdown 0<br>
ou<br>
Fechar a janela e escolher a opção "Salvar o estado da máquina".<br>

### Criando uma conta na AWS
[Amazon AWS](www.aws.amazon.com/pt/)<br>
Faça o cadastro, porém, saiba que precisa ter cartão de crédito.

### AWS - Criando uma máquina virtual em nuvem (EC2)

Escolha uma máquina EC2 Ubuntu Server qualificado para o nível gratuito (tier free) e não se esqueça de desligar a máquina ou excluí-la caso não vá utilizar mais.

### Utilizando o WSL
Verifique se o WSL está disponível:<br>
Painel de Controle >> Programas e Recursos >> Ativar ou Desativar Recursos do Windows >> Subsistema do Windows para Linux.

Vá para a Loja de Aplicativos do Windows e baixe o Ubuntu. Ele será instalado como se fosse um aplicativo normal.
Abra o "aplicativo", configure usuário e senha se solicitar.
![Ubuntu na Loja Microsoft](/ubuntu-ms-store.png)
O WSL pode ser utilizado para a parte inicial do curso sem problemas.