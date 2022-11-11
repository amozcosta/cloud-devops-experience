#!/bin/bash

# atualizar servidor
# instalar o apache2 e unzip, curl
# baixar applicação https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
# copiar os arquivos para o /var/www/html
# subir script para o github

apt update 

apt install apache2 curl unzip

cd /tmp 
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

unzip main.zip -d /var/www/html

