# -Operating-System-Functionality-Project---Shell-Script-Linux-
Proiect realizat de Peterca Andrei 

Prima data testam daca a fost introdus un numar dupa apelarea scriptului ( ./proiectG.1008.sh 1 ), in caz contrar, scriptul va rula fara parametru initial, il va prelua de la tastatura.

Pentru primul exercitiu, se introduce de la tastatura numele unui fisier, nume care este verificat si cautat in sistem. In cazul in care acesta nu exista, user-ul este rugat sa reintroduca un fisier existent.
Cu ajutorul functiei grep -q, se cauta aparitiile sirului pe care user-ul il introduce de la tastatura in fisier. In cazul in care sirul nu exista, user-ul este rugat sa introduca un sir existent.
Cu ajutorul functiei sed -i, se sterg liniile pe care apare sirul respectiv.
Pentru a testa, am luat un fisier, pe care l-am numit teste.txt. In acesta, se afla versurile din melodia "Un elefant se legana", in care am introdus cuvinte pe care codul le-a gasit si eliminat cu succes. 

Pentru al doilea exercitiu, se testeaza conexiunea la internet cu ajutorul functiei ping, ulterioarele erori fiind redirectate in /dev/null. Pingul returneaza "Online" daca conexiunea exista, si Offline in caz contrar.
Se introduce un link de la tastatura, se verifica daca input-ul este unul valid, iar in caz contrar, user-ul este rugat sa ruleze din nou programul cu un link valid. Daca link-ul este valid, incepe descarcarea.

Pentru al treilea exerictiu, se cere numele utilizatorului pe care user-ul doreste sa il adauge in sistem. Daca input-ul nu este valid, user-ul este rugat sa reintroduca.
Apoi, folosind functia id, verificam daca user-ul este deja in sistem. Daca este, user-ul este rugat sa ruleze din nou cu un user nou.
In cazul in care user-ul nu este deja in sistem, se verifica daca utilizatorul are drepturi de root pentru a executa aceasta operatiune. 
Daca user-ul a rulat script-ul cu drepturi de root (sudo), atunci se creeaza user-ul nou cu functia useradd -m si se cere schimbarea parolei acestuia cu passwd.

Pentru al patrulea exerictiu, se cere numele utilizatorului pe care user-ul doreste sa il elimine din sistem. Daca input-ul nu este valid, user-ul este rugat sa reintroduca.
Folosind functia id, se verifica daca numele user-ului este sau nu in sistem. In cazul in care nu este in sistem, va fi rugat sa ruleze din nou cu un nume valid.
Cu ajutorul functiei userdel, se sterge utilizatorul din sistem, apoi se intreaba daca se doreste si eliminarea home directory-ului acestuia. 
In cazul in care user-ul doreste sa stearga si home directory-ul, se foloseste functia rm -r pentru a elimina din sistem directorul.

In cazul in care valoarea initiala asociata functiei nu este una existenta, user-ul este anuntat si rugat sa ruleze din nou cu o valoare valida.


//


Project completed by Peterca Andrei

Firstly, we test if a number is provided after calling the script (./projectG.1008.sh 1), otherwise, the script will run without an initial parameter,
and it will be taken from the keyboard input.

For the first exercise, the user inputs the name of a file from the keyboard, which is checked and searched in the system. If the file does not exist,
the user is prompted to enter an existing file. Using the grep -q function, occurrences of the string entered by the user from the keyboard are searched for in the file.
If the string does not exist, the user is prompted to enter an existing string. Using the sed -i function, the lines containing that string are deleted.
To test, I took a file named test.txt. It contains the lyrics of the song "Un elefant se legana", in which I inserted words that the code successfully found and eliminated.

For the second exercise, the internet connection is tested using the ping function, with subsequent errors redirected to /dev/null.
If the ping returns "Online", it means the connection exists, and "Offline" otherwise. A link is entered from the keyboard, and it is checked if the input is valid.
If not, the user is asked to run the program again with a valid link. If the link is valid, the download begins.

For the third exercise, the user is asked for the username they want to add to the system. If the input is not valid, the user is asked to re-enter.
Then, using the id function, it is checked if the user is already in the system. If so, the user is asked to run it again with a new user.
If the user is not already in the system, it is checked if the user has root rights to perform this operation.
If the user ran the script with root rights (sudo), then the new user is created with the useradd -m function, and the user is prompted to change their password with passwd.

For the fourth exercise, the user is asked for the username they want to remove from the system. If the input is not valid, the user is asked to re-enter.
Using the id function, it is checked if the username is in the system or not. If it is not in the system, the user will be asked to run it again with a valid name.
Using the userdel function, the user is removed from the system, and then asked if they also want to delete the user's home directory.
If the user wants to delete the home directory as well, the rm -r function is used to remove the directory from the system.

If the initial value associated with the function is not an existing one, the user is notified and asked to run it again with a valid value.
