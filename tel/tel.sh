#!/bin/bash
if [ "$1" = "-h" ]
then
cat help.txt |less
clear
exit
fi
d=0
while [ $d -lt 100 ]
do
clear
echo -e "To jest ksiazka telefoniczna\n"
echo "Co chcesz zrobic?:"
echo -e "\t0. Wyjscie z porgramu"
echo -e "\t1. Dodaj nowy kontakt (automatyczne sortowanie)"
echo -e "\t2. Wyswietl dane"
echo -e "\t3. Wyczysc ksiazke"
echo -e "\t4. Usun jeden element ksiazki"
echo -e "\t5. Znajdz element/elementy ksiazki"
echo -e "\t6. Wyswietl instrukcje"
echo -e "\t7. Zagraj w poker kosciany\n"
echo -e "Podaj numer z powyzszej listy."
read wybor
case $wybor in
"0")
clear
exit ;;
"1")./dod.sh ;;
"2")#clear
cat tel.txt |less ;;               #to ze sa dwa pliki to relikt po opcji ktorej nie udalo mi sie dodac
"3")
clear
echo "Czy na pewno chcesz wyczyscic cala ksiazke? (t/n)"
read h
if [ "$h" = "t" ]
then
rm tel.txt
touch tel.txt
fi ;;
"4")
./usun1.sh ;;
"7")./gierka.sh ;;
"5")echo "Czego szukasz?"
read ghj
egrep "$ghj" tel.txt |less
;;
"6")cat help.txt |less ;;
esac
done

