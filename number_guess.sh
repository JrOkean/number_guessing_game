#!/bin/bash

#Definindo o BD:
PSQL="psql --username=postgres --dbname=number_guess"

echo "=== GERADOR DE NÚMEROS ALEATÓRIOS ==="
echo
_numero=$((RANDOM % 1000 + 1))
echo " Resultado = $numero"