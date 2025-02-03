#!/bin/bash

#Una funcion que vea los ultimos tres digitos del archivo para guardarlo mas adelante
tipo_archivo () {

    echo "${1: -3}"
}

#Todo lo que esta dentro de la carpeta se guarda en una lista para poder iterar sobre ellas más adelante
lista=$(ls -tr)

#Un contador para agregarlo al nombre
num=1

#El nombre que elige el usuario
nombre_new=""
read -p "Ingresa el nombre de como lo quieres renombrar: " nombre_new

#for que itera sobre los archivos para renombrarlo
for i in $lista; do
    
    tipo=$(tipo_archivo "$i")
    echo "$tipo"
    #El nombre definitivo que llevaran los archivos
    new_name="${nombre_new}${num}.${tipo}"
    mv "$i" "$new_name"
    
    #Suma la variable num para que aumente
    num=$((num + 1))
done
