#!/bin/bash
#shopt -s extglob
z=0
while [ $z -eq 0 ]
do
clear
cat tel.txt
echo -e "\nKtory element chcesz usunac? (wpisz np. 1 zeby usunac pierwsza linijke lub n jesli chcesz sie cofanc do menu)"
read boli
case $boli in
[123456789]*)
cat tel.txt |sed -i "$boli d" tel.txt
echo -e "\nElement nr $boli zostal usuniety"
echo -e "Czy chcesz usunac wiecej elementow? (t/n)"
read hy
	case $hy in
	"t") ;;
	*)let z=1 ;;
	esac ;;
"n") let z=1 ;;
*) ;;
esac
done

