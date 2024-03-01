#!/bin/bash

#Proiect realizat de Peterca Andrei si Pirvu Mihai

#Se verifica daca primul argument are o anumita valoare sau nu. Daca are atunci valoarea respectiva va fi preluata si se va putea realiza rularea cu parametru, iar daca nu, user-ul va fi rugat sa introduca una.

if [ ! -z "$1" ]; then
	apel=$1;
    else             

#Introducerea valorii asociate unei functii,respectiv 1 ,2 ,3 sau 4 pentru rularea scriptului fara parametru.	
	
        echo -n "Ce functie doriti sa apelati? (Stergerea liniilor pe care apare un sir de caractere - 1 / Descarcarea unui fisier de la tastatura - 2 / Adaugarea unui user nou - 3 / Stergerea unui user - 4 ) : " 
	read apel
fi
#Cele 4 cazuri
 case $apel in
        1)
		#Se intoduce numele fisierului, se reintroduce daca nu este un fisier existent
                echo "Introduceti numele fisierului: ";
                read nume;
                while [ ! -f $nume ]
			do
             			echo "Fisierul nu a fost gasit, va rog reintroduceti: ";
        			read nume;
			done
		#Se introduce sirul, apoi este verificat daca exista
 		echo "Introduceti sirul pe care doriti sa il eliminati:";
		read sir;
		while ! grep -q $sir "$nume"
  			do
                        	echo "Sirul nu exista, introduceti alt sir relevant: ";
        			read sir;
			done;
		#Se elimina linia pe care exista sirul din fisier
		sed -i "/$sir/d" $nume;
		echo "Operatiune efectuata cu succes!"
                ;;
        2)
		#Se verifica daca exista conexiune la internet, in cazul in care nu exista, userul este anuntat si rugat sa ruleze cand are acces la internet
		echo "Se verifica conexiunea la internet!"
		sleep 1
		ping -q -c1 www.google.ro &> /dev/null && echo Online || echo Offline, incerca sa te conectezi la internet, apoi ruleaza din nou
		#Se introduce linkul dorit
		echo "Introduceti linkul de la tastatura"
		read link
		#Se cauta si se descarca linkul
		if wget -q --method=HEAD $link;
			then
        			echo "Link-ul este valid, incepem descarcarea"
        			wget $link
			else
			#In cazul in care nu exista linkul, userul este anuntat si rugat sa ruleze cu un link valid
        			echo "Link-ul nu este valid, te rog ruleaza din nou programul cu un link valid!"
				exit
			fi
		echo "Operatiune efectuata cu succes!"
                ;;
        3)
		#Se introuce numele utilizatorului, se verifica daca numele este valid
                echo "Introduceti numele utilizatorului: "
		read nume
		while [ -z $nume ]
			do
        			echo "Introduceti un nume valid: "
        			read nume;
			done
		test=0;
		#Se verifica daca utilizatorul este deja existent, daca test=0 la finalul rularii, userul este deja in sistem
			if id $nume >/dev/null 2>&1; then
      				echo "User deja existent, rulati din nou programul cu un user valid"
				exit
			else
        			test=1
			fi
		#Se verifica valoarea lui test si se verifica daca userul are drepturi de root. In cazul in care nu are, este rugat sa ruleze cu drepturi de root
		if [ $test -eq 1 ]; then
        		if [ $EUID != 0 ]; then
               			echo "Nu aveti drepturi de root. Va rog sa rulati din nou programul cu drepturi de root"
                		exit
        		else
				#Se adauga user-ul si home directory-ul acestuia, apoi se cere schimbarea parolei al userului nou creat
                		useradd -m $nume
                		passwd $nume
        		fi
		fi
		echo "Operatiune efectuata cu succes!"
		;;
       	4)
		#Se introduce numele utilizatorului care trebuie sters, numele este verificat din punct de vedere semantic
                echo "Introduceti numele utilizatorului pe care doriti sa il stergeti:"
		read nume
		while [ -z $nume ]
		do
        		echo "Introduceti un nume valid: "
        		read nume
		done
		#Se verifica daca userul este deja in sistem
		if ! id $nume >/dev/null 2>&1; then
        		echo "Utilizatorul nu exista, va rugam sa rulati din nou si sa introduceti un utilizator valid!"
        		exit
		fi
		#Se sterge userul
		userdel $nume
		#Se intreaba daca sa se stearga si home directory-ul
		echo "Doriti sa-i stergeti si home directory-ul? (0-Da/1-Nu)"
		read verificare
		#Se sterge home directory-ul
		if [ $verificare -eq 0 ]; then
        		rm -r /home/$nume
		fi
		echo "Operatiune efectuata cu succes!"
                ;;
	*)
		#In cazul in care a fost introdusa o functie invalida, este rugat userul sa ruleze cu o functie valida
	       	echo "Va rugam introduceti o functie valida"
		exit
		;;
esac
