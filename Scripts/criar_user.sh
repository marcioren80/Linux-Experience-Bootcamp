#!/bin/bash

useradd guest10 -c "Usuário convidado10" -s /bin/bash -m -p $(openssl passwd senha123)
passwd guest10 -e

useradd guest11 -c "Usuário convidado11" -s /bin/bash -m -p $(openssl passwd senha123)
passwd guest11 -e

useradd guest12 -c "Usuário convidado12" -s /bin/bash -m -p $(openssl passwd senha123)
passwd guest12 -e

useradd guest13 -c "Usuário convidado13" -s /bin/bash -m -p $(openssl passwd senha123)
passwd guest13 -e

echo "Finalizado!!"
