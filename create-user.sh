#!/bin/bash

function create_dirs () {
	dir=/mnt/$1
	echo "criando diretório $dir"
	if [[ ! -d $dir ]]; then
		{
			mkdir $dir && echo "Diretório $dir criado com sucesso"
		}||{
			echo "Nao foi possivel criar diretório $dir"
			exit 1
		}
	else
		echo "Diretório $dir já existe"
	fi

	if [[ $1 == "publico" ]];then
		chmod 777 $dir
	else
		chown root:$2 $dir
		chmod 770 $dir
	fi
	
}

function check_create_groups () {
	if [[ ! $( cat /etc/group | grep $1 ) ]]; then
		echo "criando grupo $1"
		{
			groupadd $1 && echo "Grupo criado com sucesso"
		}||{
			echo "Não foi possivel criar grupo."
			exit 1
		}
	else
		echo "Grupo $1 já existe"
	fi
}


function criate_users () {
	
	check_create_groups $2
	create_dirs $3 $2

	if [[ ! $( cat /etc/passwd | grep $1) ]]; then
		echo "criando usuário $1"
		useradd $1 -m -s /bin/bash -p $(openssl passwd -crypt Mudar123) -G $2
	else
		echo "usuário já existe"
	fi

}

create_dirs publico

criate_users carlos GRP_ADM adm
criate_users maria GRP_ADM adm
criate_users joao GRP_ADM adm

criate_users debora GRP_VEN ven
criate_users sebastiana GRP_VEN ven
criate_users roberto GRP_VEN ven

criate_users josefina GRP_SEC sec
criate_users amanda GRP_SEC sec
criate_users rogerio GRP_SEC sec
