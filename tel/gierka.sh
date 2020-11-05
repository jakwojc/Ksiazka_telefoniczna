#!/bin/bash
clear
echo "witaj w gierce poker kosciany"
infcount=1
kredyty=1000
while [ $infcount -le 100 ]
do
debilcount=1
echo "masz $kredyty kredytow. Zeby zagrac musisz miec 500, dodatkowo kasyno pobiera 200 za kazda runde. (wcisnij enter)"
read niewazne1
while [ $debilcount -le 100 ]
do
        if [ $kredyty -ge 700 ]
                then
                let kredyty=$(($kredyty-700))
                let stawka0=500
                debilcount=101
        else
                echo "za malo kredytow - przegrales"
                exit
        fi
done
let k1=$RANDOM%6+1
let k2=$RANDOM%6+1
let k3=$RANDOM%6+1
let k4=$RANDOM%6+1
let k5=$RANDOM%6+1
echo "Twoje kosci"
echo "[$k1] [$k2] [$k3] [$k4] [$k5]"
echo "masz $kredyty kredytow. Za ile podbijasz?"
debilcount=1
while [ $debilcount -le 100 ]
do
read stawka1
        if [ $stawka1 -le $kredyty ]
                then
                let kredyty=$(($kredyty-$stawka1))
                debilcount=101
        else
                echo "nie masz tyle kredytow"
        fi
done
echo "ktore chcesz wymienic kosci (w formie np. 1 3 4, jak nic to 0)"
read dowymiany
for arg in $dowymiany
        do
                case $arg in
                '1')let k1=$RANDOM%6+1 ;;
                '2')let k2=$RANDOM%6+1 ;;
                '3')let k3=$RANDOM%6+1 ;;
                '4')let k4=$RANDOM%6+1 ;;
                '5')let k5=$RANDOM%6+1 ;;
                *  );;
                esac
        done
echo "nowe kosci:"
echo "[$k1] [$k2] [$k3] [$k4] [$k5]"
ile1=0
ile2=0
ile3=0
ile4=0
ile5=0
ile6=0
for arg2 in $k1 $k2 $k3 $k4 $k5
        do
        case $arg2 in
                '1')((ile1++));;
                '2')((ile2++));;
                '3')((ile3++));;
                '4')((ile4++));;
                '5')((ile5++));;
                '6')((ile6++));;
        esac
        done
sumst=$(($stawka0+$stawka1))
if [ $ile1 -eq 5 ]||[ $ile2 -eq 5 ]||[ $ile3 -eq 5 ]||[ $ile4 -eq 5 ]||[ $ile5 -eq 5 ]||[ $ile6 -eq 5 ]
        then
        wyg=$(($sumst*3))
        echo "poker! Wygrywasz 3 stawki, czyli $wyg kredytów!"
elif [ $ile1 -eq 4 ]||[ $ile2 -eq 4 ]||[ $ile3 -eq 4 ]||[ $ile4 -eq 4 ]||[ $ile5 -eq 4 ]||[ $ile6 -eq 4 ]
        then
        let wyg=$(($sumst*3/2))
        echo "kareta! Wygrywasz 1,5 stawki, czyli $wyg kredytow!"
elif [ $ile1 -eq 3 ]||[ $ile2 -eq 3 ]||[ $ile3 -eq 3 ]||[ $ile4 -eq 3 ]||[ $ile5 -eq 3 ]||[ $ile6 -eq 3 ]
        then
                if [ $ile1 -eq 2 ]||[ $ile2 -eq 2 ]||[ $ile3 -eq 2 ]||[ $ile4 -eq 2 ]||[ $ile5 -eq 2 ]||[ $ile6 -eq 2 ]
                then
                let wyg=$(($sumst*2))
                echo "full! Wygrywasz 2 stawki, czyli $wyg kredytów!"
 else
                let wyg=$(($sumst*3/2))
                echo "trojka! Wygrywasz 1,5 stawki, czyli $wyg kredytow!"
                fi
elif [ $ile1 -eq 2 ]||[ $ile2 -eq 2 ]||[ $ile3 -eq 2 ]||[ $ile4 -eq 2 ]||[ $ile5 -eq 2 ]||[ $ile6 -eq 2 ]
        then
        #echo "i1=$ile1 i2=$ile2 i3=$ile3 i4=$ile4 i5=$ile5 i6=$ile6"
                if ([ $ile1 -eq 2 ]&&[ $ile2 -eq 2 ])||([ $ile1 -eq 2 ]&&[ $ile3 -eq 2 ])||([ $ile1 -eq 2 ]&&[ $ile4 -eq 2 ])||([ $ile1 -eq 2 ]&&[ $ile5 -eq 2 ])||([ $ile1 -eq 2 ]&&[ $ile6 -eq 2 ])||([ $ile2 -eq 2 ]&&[ $ile3 -eq 2 ])
                then
                let wyg=$sumst
                echo "dwie pary! Wygrywasz stawke, czyli $wyg kredytow!"
                elif ([ $ile2 -eq 2 ]&&[ $ile4 -eq 2 ])||([ $ile2 -eq 2 ]&&[ $ile5 -eq 2 ])||([ $ile2 -eq 2 ]&&[ $ile6 -eq 2 ])||([ $ile3 -eq 2 ]&&[ $ile4 -eq 2 ])||([ $ile3 -eq 2 ]&&[ $ile5 -eq 2 ])||([ $ile3 -eq 2 ]&&[ $ile6 -eq 2 ])
                then
                let wyg=$sumst
                echo "dwie pary! Wygrywasz stawke, czyli $wyg kredytow!"
                elif ([ $ile4 -eq 2 ]&&[ $ile5 -eq 2 ])||([ $ile4 -eq 2 ]&&[ $ile6 -eq 2 ])||([ $ile5 -eq 2 ]&&[ $ile6 -eq 2 ])
                then
                let wyg=$sumst
                echo "dwie pary! Wygrywasz stawke, czyli $wyg kredytow!"
                else
                let wyg=$(($sumst/4))
                echo "para! Wygrywasz 0,25 stawki, czyli $wyg kredytow!"
                fi
elif [ $(($ile1+$ile2+$ile3+$ile4+$ile5)) -eq 5 ]||[ $(($ile2+$ile3+$ile4+$ile5+$ile6)) -eq 5 ]
        then
        let wyg=$(($sumst*3/2))
        echo "street! wygrywasz 1,5 stawki, czyli $wyg kredytow!"
else
        let wyg=0
        echo "nic! Tracisz stawke, czyli $sumst kredytow"
fi
let kredyty=$(($kredyty+$wyg))
echo "grasz dalej? (tak/nie)"
read pytanie
case $pytanie in
"tak") ((infcount++));;
*) let infcount=101;;
esac
clear
done


