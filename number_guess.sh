#!/bin/bash

#Definindo o BD:
PSQL="psql --username=postgres --dbname=number_guess -t --no-align -c"

echo "=== GERADOR DE NÚMEROS ALEATÓRIOS ==="
echo

#Começo do jogo, escolha de jogador 
#(nome do jogador)
echo "Informe seu nome, jogador"
read NAMEPlayer

#Verificar se o jogador já é cadastrado (verificação no banco de dados)
USER_INFO=$($PSQL "SELECT playername, games_played, best_game FROM players WHERE playername='$NAMEPlayer'")

#Se USER_INFO não tem leght zero. Se estiver vazia, então é a primeira vez do jogador. Do contrário, ele já efetuou pelo menos uma jogada.
if [[ -z $USER_INFO ]]; then
  echo "Bem-vindo ao jogo, $NAMEPlayer, é um prazer tê-lo aqui!"
  INSERT_USER=$($PSQL "INSERT INTO players(playername) VALUES('$NAMEPlayer')")
else 
  "$USER_INFO" | while IFS="|" read NAME GAMES_PLAYED BEST_GAME; do
    echo "Olha ele aí, $NAME! Você já participou de $GAMES_PLAYED jogos e seu record foi a aposta no jogo $BEST_GAME."
  done
fi

#Gere um número aleatório
SECRET_NUMBER=$((RANDOM % 1000 + 1))
echo "Vamos ver como está sua sorte!"
echo "Aposte em um número de 1 a 1000"
read P_GUESS


