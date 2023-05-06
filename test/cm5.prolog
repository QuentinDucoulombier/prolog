:-use_module(library(clpfd)).

toto(1).
toto(2).
toto(2).

toto2(1,5).
toto2(4,6).
toto2(3,7).



%findall(X,toto(X),B).

%findall(Y,toto2(X,Y),B).
%findall([X,Y],toto2(X,Y),B).
%findall(X,(toto2(X,_),toto(X)),B).
%Celui la pas test
%findall(X,(toto2(X,_),toto(X), X #> 2),B).

%list to set
%findall(X,toto(X),B),list_to_set(B,S).

%Lecture de fichiers
%affiche le flow
%open('cm5.prolog',read,S,[]).
%Lit la premiere ligne
%open('cm5.prolog',read,S,[]),read(S,T).
%Lit les deux premiere ligne etc
%open('cm5.prolog',read,S,[]),read(S,T), read(S,T2).


%ecrite de fichier
%Remplace et ecrit
%open('cm5Bis.prolog',write,S,[]),write(S,toto),close(S).
%Ajouter a la fin
%open('cm5Bis.prolog',append,S,[]),write(S,'\n'),write(S,titi),close(S).

%csv file
%?- csv_read_file('cm5Bis.prolog',R,[]).
%R = [row(tototiti), row(titi)].

%?- csv_read_file('cm5.prolog',R,[]).
%erreur ici arrité de 2 a un moment:
%toto2(1,5).
%utilisé option match_arity:
%csv_read_file('cm5.prolog',R,[match_arity(false)]).

%csv_read_file('cm5.prolog',R,[match_arity(false)]),maplist(writeln,R).

%csv_read_file('cm6Ter.prolog',R,[match_arity(false)]),maplist(writeln,R).
%transforme en liste
%row(1,2,3) =.. L.
%>L = [row, 1, 2, 3].
%row(1,2,3) =.. [_|L].
%>L = [1, 2, 3].

%transforme tout direct en liste
%csv_read_file('cm6Ter.prolog',R,[match_arity(false)]),maplist(=..,R,L).
%>R = [row(1, 2, 3), row(4, 5, 6), row(7, 5, 8)],
%>L = [[row, 1, 2, 3], [row, 4, 5, 6], [row, 7, 5, 8]].


%Tout faire direct avec predicat dans cm6
%?- ['cm6.prolog'].
%true.

%?- csv_read_file('cm6Ter.prolog',R,[match_arity(false)]),maplist(f,R,L).
%R = [row(1, 2, 3), row(4, 5, 6), row(7, 5, 8), row('')],
%L = [[1, 2, 3], [4, 5, 6], [7, 5, 8], ['']].

%Ajout separator
%?- csv_read_file('cm6Ter.prolog',R,[match_arity(false),separator(0' )]),maplist(f,R,L).
%R = [row('1,2'), row('4,5,6'), row('7,5,8'), row('')],
%L = [['1,2'], ['4,5,6'], ['7,5,8'], ['']].


