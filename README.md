# Renombrador de Archivos en Bash

Este script permite renombrar todos los archivos en un directorio de manera secuencial, utilizando un nombre base definido por el usuario. Los archivos mantienen su extensión original y son renombrados con un número incremental.

## Funcionalidades

1. Identifica la extensión de cada archivo en el directorio actual.
2. Renombra los archivos utilizando un nombre base proporcionado por el usuario y un número incremental.
3. Mantiene el orden cronológico de los archivos en el directorio, asegurando que los archivos más antiguos se procesen primero.

## ¿Cómo funciona?

### Entrada del usuario

El script solicita al usuario que ingrese un **nombre base** que se usará para renombrar los archivos. Por ejemplo, si el usuario ingresa `archivo_`, los archivos renombrados tendrán nombres como `archivo_1.txt`, `archivo_2.png`, etc.

### Proceso

1. **Listar archivos:** Se obtienen todos los archivos en el directorio actual utilizando `ls -tr`, que organiza los archivos por orden cronológico inverso.
2. **Identificar extensión:** Cada archivo es procesado para extraer sus últimos tres caracteres, que suelen ser la extensión (`.txt`, `.png`, etc.).
3. **Renombrar archivos:** Cada archivo se renombra secuencialmente utilizando el nombre base ingresado por el usuario, seguido de un número incremental.
4. **Incremento:** El número se incrementa automáticamente con cada archivo procesado.

### Salida

Al finalizar, todos los archivos en el directorio habrán sido renombrados con el formato:  
`<nombre_base><número>.<extensión>`

## Código

```bash
#!/bin/bash

# Función que extrae los últimos tres caracteres de un archivo (su extensión)
tipo_archivo () {
    echo "${1: -3}"
}

# Listar los archivos en el directorio actual en orden cronológico inverso
lista=$(ls -tr)

# Inicializar un contador para numerar los archivos
num=1

# Solicitar al usuario un nombre base para los nuevos archivos
nombre_new=""
read -p "Ingresa el nombre de como lo quieres renombrar: " nombre_new

# Iterar sobre los archivos en el directorio
for i in $lista; do
    # Obtener la extensión del archivo
    tipo=$(tipo_archivo "$i")
    # Crear el nuevo nombre para el archivo
    new_name="${nombre_new}${num}.${tipo}"
    # Renombrar el archivo
    mv "$i" "$new_name"
    # Incrementar el contador
    num=$((num + 1))
done
```

## Ejemplo de uso

Supongamos que tienes los siguientes archivos en tu directorio:  
```text
documento1.txt  
imagen.png  
presentación.pdf  
```

Ejecuta el script y proporciona el nombre base `archivo_` cuando se te solicite.  
El resultado será:  
```text
archivo_1.txt  
archivo_2.png  
archivo_3.pdf  
```

## Consideraciones

- Este script debe ejecutarse en el mismo directorio donde se encuentran los archivos a renombrar.
- Solo procesa archivos en el nivel actual del directorio.
- Si hay archivos con el mismo nombre y extensión después del renombrado, podrían sobrescribirse.

## Cómo ejecutarlo

1. Guarda el código en un archivo, por ejemplo, `renombrar.sh`.
2. Haz que el archivo sea ejecutable con el siguiente comando:
   ```bash
   chmod +x renombrar.sh
   ```
3. Ejecuta el script:
   ```bash
   ./renombrar.sh
   ```

## Contribuciones

Si encuentras un error o tienes una idea para mejorar este script, ¡estaré encantado de escuchar tus sugerencias! Puedes contribuir abriendo un issue o enviando un pull request en el repositorio.
