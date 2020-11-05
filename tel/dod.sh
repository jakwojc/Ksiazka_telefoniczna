#!/bin/bash
b=t
while [ "$b" = "t" ]
do
clear
echo "Podaj numer:"
read numer
echo "Podaj nazwe:"
read nazwa
a=1
while [ $a -lt 100 ]
do
echo "Zapisac nastepujace dane: $nazwa - $numer? (t/n)"
read zap
        case $zap in
        t*)echo -n -e "$nazwa" >> tel.txt
	let g=$((30-${#nazwa}))
	while [ $g -gt 0 ]
		do
		echo -n " " >> tel.txt
		((g--))
		done
	echo  -e "$numer" >> tel.txt
        a=100 ;;
        n*) a=100 ;;
        *)echo "zla odpowiedz"
        clear ;;
        esac
done
echo "$(sort -d tel.txt)" > tel.txt
clear
echo "Czy chcesz zapisac wiecej danych? (t/n)"
read b
done

