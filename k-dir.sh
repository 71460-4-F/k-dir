#!/bin/bash
# By Tiago A. F.

if [ ! -z ${2} ]; then
   function art () {
   C="\033[0;33m"
   F="\033[0;37m"
   C2="\033[1;31m"
   C3="\033[1;34m"
   C4="\033[1;32m"
   C6="\033[1;33m"
   echo -e "
            \   /        \   /        \   /        \   /        \   /
   ----------///----------///----------///----------///----------///----------
            /   \        /   \        /   \        /  \         /  \\


            $C            ██╗  ██╗     ██████╗ ██╗██████╗
            $C            ██║ ██╔╝     ██╔══██╗██║██╔══██╗
            $C            █████╔╝█████╗██║  ██║██║██████╔╝
            $C            ██╔═██╗╚════╝██║  ██║██║██╔══██╗
            $C            ██║  ██╗     ██████╔╝██║██║  ██║ V 1.0
            $C            ╚═╝  ╚═╝     ╚═════╝ ╚═╝╚═╝  ╚═╝  $F

            \   /        \   /        \   /        \   /        \   /
   ----------///----------///----------///----------///----------///----------
            /   \        /   \        /   \        /  \         /  \\
   "
   }
   URL=$1
   LIST=$2
   BAR="/"
   ENC=0
   echo "" > log.txt
   TENT=$(sed -n '$=' $LIST)
   AT=0
   while read LIN
   do
      clear
      art
      AT=$(($AT + 1))
      echo -e " $URL$BAR$C6$LIN$F$BAR"
      echo -e " Buscando... $C2$AT$F de $C3$TENT$F"
      echo -e " $C4$ENC$F encontrados."
      MSG=$(curl -I -s $URL$BAR$LIN$BAR | head -n 1 | grep -o -e "OK" -e "Forbidden")
      if [ ! -z $MSG ]; then
         RESP=$(echo "$URL$BAR$LIN$BAR --> $MSG")
         echo $RESP >> log.txt
         ENC=$(($ENC + 1))
      fi
   done < $LIST
   clear
   art
   echo -e "\n Concluído."
   echo -e " $C4$ENC$F encontrados."
else
   echo Use: ${0} [url] [lista]
fi
