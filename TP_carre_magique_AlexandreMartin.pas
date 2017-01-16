PROGRAM carre_magique;

	//BUT : afficher un carré magique de 5*5 ou de 7*7
	//ENTRER : n/a (constante 5 ou 7)
	//SORTIE : le carré magique à l'aide d'un tableau à deux dimension

uses crt;

const

    MAX=5; // taille du carré magique (peut être aussi de 7)

type

    matrice = array [1..MAX,1..MAX] of integer; // déclaration de la matrice qui tiendra le carré magique

procedure INITIALISATION(var T1 : matrice ; var case_active_j :integer ; var case_active_i :integer); //initialise le tableau et la premiére case du tableau

    var
        i:integer;
        j:integer;

    Begin

        for i:=1 to MAX do
            Begin
                for j:=1 to MAX do
                    Begin
                        T1[i,j]:=0; //initialise toutes les case du tableau à zero
                    end;
            end;
        T1[3,2]:=1; // initialise la premiére case active
        case_active_j:=2; // initialise les cordonné de j
        case_active_i:=3; // initialise les cordonné de i
    end;

procedure AVANCER_GAUCHE(var case_active_j :integer ; var case_active_i :integer); //fait avancer la case active vers le nord-est

    Begin
        case_active_j:=case_active_j-1; 
        case_active_i:=case_active_i-1;
        IF (case_active_i=0) THEN //test si i (cologne) sort du tableau vers la gauche et si oui applique les coordonée du droite du tableau
            case_active_i:=MAX;
        IF (case_active_j=0) THEN //test si j (ligne) sort du tableau vers le haut et si oui applique les coordonée du bas du tableau 
            case_active_j:=MAX;
    end;

procedure AVANCER_DROITE(var case_active_j :integer ; var case_active_i :integer); //fait avancer la case active vers le nord-ouest

    Begin
        case_active_j:=case_active_j-1;
        case_active_i:=case_active_i+1;
        IF (case_active_j=0) THEN //test si j (ligne) sort du tableau vers le haut et si oui applique les coordonée du bas du tableau
            case_active_j:=MAX;
        IF (case_active_i=MAX+1) THEN //test si i (cologne) sort du tableau vers la droite et si oui applique les coordonée du gauche du tableau
            case_active_i:=1;
    end;

procedure AVANCER(var T1 : matrice ;var  case_active_j :integer ; var case_active_i :integer ); //procedure qui fait passer d'une case a une autre

    Begin
        AVANCER_DROITE( case_active_j , case_active_i); // applique un délacement nord-ouest à la case active
            IF (T1 [case_active_i,case_active_j]<> 0) THEN // regarde si la case active est vide
                REPEAT
                    AVANCER_GAUCHE( case_active_i , case_active_j); // applique un délacement nord-est à la case active
                UNTIL (T1 [case_active_i,case_active_j] = 0); // regarde si la case active est vide 
    End;

procedure PLACER(T1 : matrice ; case_active_i,case_active_j : integer); //procedure qui a pour but de placer les nombres dans l'interface graphique

	Begin
		T1[case_active_i,case_active_j]:= y; //affecte la valeur de y dans la matrice
	End;

procedure AFFICHER(var T1 : matrice );//procedure final qui affiche le carré magique complet

    VAR

        i,j : integer; // variable pour boucle for

    Begin

        for i:=1 to (MAX*2)+1 do
            Begin
                for j:=1 to (MAX*2)+1  do
                    Begin
                        write('..') // initialisation de l'interface graphique
                    end;
                writeln;
            end;

        for i:=1 to MAX do
            Begin
                for j:=1 to MAX do
                    Begin
                        gotoXY(((i*4)-1),(j*2)); // place les numéros aux bon endroit sur l'interface graphique
                        IF (T1[i,j]<10) THEN
                            write(' ',T1[i,j]) // pour le chiffre affiche le chiffre avec un espace au début
                        ELSE
                            write(T1[i,j]); // pour les nombres affiche le nombre
                    end;
            end;
    End;

VAR

    T1 : array [1..MAX,1..MAX] of integer; //matrice du carré magique
    case_active_j : integer ; //coordonné des colones
    case_active_i : integer ; //coordonné des lignes
    case_max : integer ; // nombres de case maximum du carré magique
    y : integer ; //variable pour boucle for

Begin

    clrscr;
    INITIALISATION (T1 , case_active_j , case_active_i); //initialise le tableau et la premiére case du tableau
    case_max:=MAX*MAX; // calcule le nombre de case maximum en fonction de la constante MAX 
    for y:=2 to case_max do 
        Begin
            AVANCER (T1 ,case_active_j , case_active_i ); //procedure qui fait passer d'une case a une autre
            T1[case_active_i,case_active_j]:= y; //affecte la valeur de y dans la matrice
        End;
    AFFICHER(T1); //procedure final qui affiche le carré magique complet
    readln;

End.

{
	//PROGRAMME carre_magique
	//BUT : afficher un carré magique de 5*5 ou de 7*7
	//ENTRER : n/a (constante 5 ou 7)
	//SORTIE : le carré magique à l'aide d'un tableau à deux dimension



	const

	    MAX=5 // taille du carré magique (peut être aussi de 7)

	type

	    matrice = TABLEAU [1..MAX,1..MAX] DE ENTIER // déclaration de la matrice qui tiendra le carré magique

	procedure INITIALISATION(var T1 : matrice ; var case_active_j :ENTIER ; var case_active_i :ENTIER) //initialise le tableau et la premiére case du tableau

	    var
	        i:ENTIER
	        j:ENTIER

	    DEBUT

	        POUR i=1 A MAX FAIRE
	                POUR j=1 A MAX FAIRE
	                    T1[i,j] <- 0 //initialise toutes les case du tableau à zero
	                FINPOUR
	        FINPOUR
	        T1[3,2] <- 1 // initialise la premiére case active
	        case_active_j <- 2 // initialise les cordonné de j
	        case_active_i <- 3 // initialise les cordonné de i

	    FIN

	procedure AVANCER_GAUCHE(var case_active_j :ENTIER ; var case_active_i :ENTIER) //fait avancer la case active vers le nord-est

	    DEBUT
	        case_active_j <- case_active_j-1
	        case_active_i <- case_active_i-1
	        SI (case_active_i=0) ALORS //test si i (cologne) sort du tableau vers la gauche et si oui applique les coordonée du droite du tableau
	            case_active_i <- MAX
	        FINSI
	        SI (case_active_j=0) ALORS //test si j (ligne) sort du tableau vers le haut et si oui applique les coordonée du bas du tableau 
	            case_active_j <- MAX
	        FINSI
	    FIN

	procedure AVANCER_DROITE(var case_active_j :ENTIER ; var case_active_i :ENTIER) //fait avancer la case active vers le nord-ouest

	    DEBUT
	        case_active_j <- case_active_j-1;
	        case_active_i <- case_active_i+1;
	        SI (case_active_j=0) ALORS //test si j (ligne) sort du tableau vers le haut et si oui applique les coordonée du bas du tableau
	            case_active_j <- MAX
	        FINSI
	        SI (case_active_i=MAX+1) ALORS //test si i (cologne) sort du tableau vers la droite et si oui applique les coordonée du gauche du tableau
	            case_active_i <- 1
	        FINSI
	    FIN

	procedure AVANCER(var T1 : matrice ;var  case_active_j :ENTIER ; var case_active_i :ENTIER ) //procedure qui fait passer d'une case a une autre

	    DEBUT
	        AVANCER_DROITE( case_active_j , case_active_i) // applique un délacement nord-ouest à la case active
	            SI (T1 [case_active_i,case_active_j]<> 0) ALORS // regarde si la case active est vide
	                REPETER
	                    AVANCER_GAUCHE( case_active_i , case_active_j) // applique un délacement nord-est à la case active
	                JUSQU'A (T1 [case_active_i,case_active_j] = 0) // regarde si la case active est vide
	            FINSI 
	    FIN
	
	procedure PLACER(T1 : matrice ; case_active_i,case_active_j : integer) //procedure qui a pour but de placer les nombres dans l'interface graphique

		DEBUT
			T1[case_active_i,case_active_j] <- y //affecte la valeur de y dans la matrice
		FIN


	procedure AFFICHER(var T1 : matrice )//procedure final qui affiche le carré magique complet

	    VAR

	        i,j : ENTIER // variable pour boucle POUR

	    DEBUT

	        POUR i=1 A (MAX*2)+1 FAIRE
	                POUR j=1 A (MAX*2)+1  FAIRE
	                    ECRIRE('..') // initialisation de l'interface graphique
	                FINPOUR
	            ECRIRE
	        FINPOUR

	        POUR i=1 A MAX FAIRE
	                POUR j=1 A MAX FAIRE
	                        ALLER A(((i*4)-1),(j*2)); // place les numéros aux bon endroit sur l'interface graphique
	                        SI (T1[i,j]<10) ALORS
	                            ECRIRE(' ' & T1[i,j]) // pour le chiffre affiche le chiffre avec un espace au début
	                        	SINON
	                            ECRIRE(T1[i,j]); // pour les nombres affiche le nombre
	                        FINSI
	                FINPOUR
	        FINPOUR
	    FIN

	VAR

	    T1 : array [1..MAX,1..MAX] DE ENTIER //matrice du carré magique
	    case_active_j : ENTIER  //coordonné des colones
	    case_active_i : ENTIER  //coordonné des lignes
	    case_max : ENTIER  // nombres de case maximum du carré magique
	    y : ENTIER  //variable pour boucle POUR

	DEBUT

	    INITIALISATION (T1 , case_active_j , case_active_i) //initialise le tableau et la premiére case du tableau
	    case_max <- MAX*MAX // calcule le nombre de case maximum en fonction de la constante MAX 
	    POUR y=2 A case_max FAIRE 
	        DEBUT
	            AVANCER (T1 ,case_active_j , case_active_i ) //procedure qui fait passer d'une case a une autre
	            PLACER (T1 ,case_active_j , case_active_i ) //affecte la valeur de y dans la matrice
	        FIN
	    AFFICHER(T1) //procedure final qui affiche le carré magique complet

	FIN.
}



{
	faire un programme qui affiche un carré magique
	ce carré magique aura une dimension impaire définie en constante
	on pourra ainsi changer la taille du carré en changeant la constante
	un carré magique est un tableau a deux dimension (entier)dont toutes les lignes,
	toutes les colonnes et les deux diagonales ont la meme somme

	principe de l'algo:

	obligatoirement utiliser un tableau a 2 dimensions
	le premier entier 1 se trouve au nord du milieu de la table
	on place les chiffres de facon croissantes
	en allant au nord-est de la position courante une seule fois
	si la place est deja prise on se deplace au nord-ouest
	jusqu'a trouver cette place libre
	on s'arrete au carré au dimension de 5*5 ou 7*7
	le tableau est considéré comme sphérique,
	cad qui si on arrive au dela de la dernière colonnes
	on revien a la premiere colonne, de même pour les lignes.

	23 6  19 2  15
	10 18 1  14 22
	17 5  13 21 9
	4  12 25 8  16
	11 24 7  20 3

	                        MAGIC

	INIT        AVANCER     RECHERCHER VIDE     PLACER      AFFICHER

	AVANCER G   CORRIGER    AVANCER D
}
