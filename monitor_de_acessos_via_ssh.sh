#!/bin/bash
last -s yesterday | awk -F " " 'NR > 1 {print $3}' | sort | uniq -c > saida_padrão.txt
VAR=$(find -type f -name "saida_padrão.txt")
MAX=$(awk 'BEGIN { max = -inf }{ if ($1>max) max = $1} END { print max }' "$VAR")
awk -v max="$MAX" '$1 == max { print "Parabéns " $2 ", você é o usuário que mais acessou esta VM via ssh, foram um total de " $1 " vezes!" }' "$VAR"
