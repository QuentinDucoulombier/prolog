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
%open('cm6.prolog',write,S,[]),write(S,toto),close(S).


 