#!/bin/bash

quantidade=$1
salvar=$2
orgName="Organizacao"
automatico=1
gam="$HOME/bin/gam/gam"
i=0;


# Gerando os Nomes
while [ $i -lt $quantidade ]
do

	fullName=`names`
        firstName=`echo $fullName | cut -d " " -f 1`
        lastName=`echo $fullName | cut -d " " -f 2`

	if [ $i -eq 0 ]; then

		echo "gam create user $firstName.$lastName firstname $firstName lastname $lastName password \"`pwgen -1y`\" org $orgName" > $salvar

	else
		echo "gam create user $firstName.$lastName firstname $firstName lastname $lastName password \"`pwgen -1y`\" org $orgName" >> $salvar
		
	fi

	if [ $automatico ]; then
        	echo
                echo "Criando conta #$((i+1)) - $fullName"
                echo "gam create user `echo $firstName | tr '[:upper:]' '[:lower:]'`.`echo $lastName | tr '[:upper:]' '[:lower:]'` firstname $firstName lastname $lastName password \"`pwgen -1y`\" org $orgName"
                $gam create user `echo $firstName | tr '[:upper:]' '[:lower:]'`.`echo $lastName | tr '[:upper:]' '[:lower:]'` firstname $firstName lastname $lastName password \"`pwgen -1y`\" org $orgName
                echo
	fi

	true $(( i++ ))
done

