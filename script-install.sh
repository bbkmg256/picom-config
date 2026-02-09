#!/bin/bash

# Script de instalación de config picom # [ NO TERMINADO! ]


#====

# NOTAS:
# - Actualmente este script sobrescribe la configuración de picom ya existente,
# aun que haga un backup, tener cuidado en su ejecución.

#====


#= VARS =#
#RUTA=$HOME/.config/picom
RUTA=$HOME/LOL
DIR_CONF_PICOM=$(find ~/.config -type d -name "picom")

#= FUNCS =#
# Mensajes de confirmación de ejecución
confirmar_exito(){
	if [ $? -gt 0 ]; then
		echo "Ocurrio un problema al $1!"
		exit 1
	if

	# Para poder escribir un mensaje personzalidado
	if [ $2 != "" ]; then
		echo "$2!"
	else
		echo "Operación realizada con exito!"
	fi

	sleep 2
}

#= INICIO =#
# TODO: Confirmar si ya existen backups, para no sobrescribirlos
echo "Comprondo directorio y fichero de configuración existente..."; sleep 2
if [ $DIR_CONF_PICOM == "" ]; then
	mkdir $RUTA; touch $RUTA/picom.conf
	# echo "Creado directorio de configuración para picom..."; 
fi
confirmar_exito "crear directorio de configuración" "Directorio creado con exito"

echo "Realizando backup..."
cp $RUTA/picom.conf $RUTA/picom.conf.bak
# echo "picom.conf backupeado..."; sleep 2
confirmar_exito "crear backup del fichero de configuración" "Backup de picom.conf realizado"

echo "Copiando configuración..."; sleep 2
# El parametro -O (mayuscula), copia el contenido a un archivo nuevo nombrado igual al del que copio el contenido 
curl -O https://raw.githubusercontent.com/bbkmg256/picom-config/refs/heads/main/picom.conf | tee $RUTA/picom.conf
# echo "Configuración copiada..."; sleep 2
confirmar_exito "copiar información al archivo picom.conf" "Configuración copiada"

# Confirmación final
echo "Modifique el comando de inicio de picom con <picom --config ~/.config/picom/picom.conf> si todavía no lo tiene."
exit 0
#= FIN =#