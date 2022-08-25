#!/bin/bash
!
echo "## Atualizar lista de repositórios"
apt-get update
sleep 10
!
echo "## Aplicar atualizações disponíveis"
apt-get upgrade -y
sleep 10
!
echo "## Instalar o Apache"
apt-get install apache2 -y
sleep 10
!
echo "## Instalar o Unzip"
apt-get install unzip -y
sleep 10
!
echo "## Entrar no diretório temporário /tmp"
cd /tmp
sleep 10
!
echo "## Baixar os arquivos do site de exemplo"
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
!
echo "## Descompactar o zip"
unzip main.zip
!
echo "## Entrar na pasta descompactada"
cd linux-site-dio-main
!
echo "## Copiando arquivos para a pasta principal do Apache"
cp -R * /var/www/html/
