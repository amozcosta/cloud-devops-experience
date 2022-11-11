#!/bin/bash

# atualizar servidor
# instalar o apache2 e unzip, curl
# baixar applicação https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
# copiar os arquivos para o /var/www/html
# subir script para o github

echo "Atualizando e instalando softwares necessários"
apt update && apt upgrade -y && apt install apache2 curl unzip

echo "Baixando e copiando arquviso da aplicação"
cd /tmp 
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

unzip main.zip -d /var/www/html
