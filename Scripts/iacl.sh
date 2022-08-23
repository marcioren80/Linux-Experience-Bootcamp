#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."
## OBS: No Ubuntu 22.04 não usa o parâmetro -crypt para passar a senha criptografada

echo "Usuários do grupo  GRP_ADM: carlos, maria, joao."
useradd carlos -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_ADM
useradd maria -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_ADM
useradd joao -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_ADM

echo "Usuários do grupo  GRP_VEN: debora, sebastiana, roberto."
useradd debora -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_VEN
useradd sebastiana -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_VEN
useradd roberto -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_VEN

echo "Usuários do grupo GRP_SEC: josefina, amanda, rogerio."
useradd josefina -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_SEC
useradd amanda -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_SEC
useradd rogerio -s /bin/bash -m -p $(openssl passwd senha123) -G GRP_SEC

echo "Definindo as permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Fim....."
