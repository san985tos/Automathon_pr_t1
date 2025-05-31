#!/bin/bash

# Directorio donde se crearán los archivos
DEST="/fill_test"

# Crear el directorio si no existe
mkdir -p "$DEST"

# Número total de archivos a crear
TOTAL=6

# Tamaño por archivo
SIZE="1G"

for i in $(seq 1 $TOTAL); do
  FILE="${DEST}/file_${i}"
  echo "Creando archivo $FILE de $SIZE..."

  # Usar fallocate si está disponible, si no usar dd
  if command -v fallocate &>/dev/null; then
    fallocate -l $SIZE "$FILE"
  else
    dd if=/dev/zero of="$FILE" bs=1G count=1
  fi

  echo "Archivo $i creado. Esperando 10 segundos..."
  sleep 10
done

echo "Listo. Se crearon $TOTAL archivos de $SIZE en $DEST"
