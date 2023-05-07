:-use_module(library(clpfd)).

appartient(X,[X|_]).
appartient(X,[_|R]):-
    appartient(X,R).

appartient_liste([X|_],L2):-
    appartient(X,L2).
appartient_liste([_|R],L2):-
    appartient_liste(R,L2).

%faire une fonction qui concatene de liste 

effaceElt(_,[],[]).

effaceElt(X,[X|L],L2):-    
    effaceElt(X,L,L2).

effaceElt(X,[T|L],[T|L2]):-
    dif(X,T),
    effaceElt(X,L,L2).


%fonction concatene

ajoutListe(X,L1,[X|L1]).


concateee([], L2, L2).
concateee([X | R], L1, [X | LS]) :-
    concateee(R, L1, LS).


%DS 2019

pirate(bob).

communique(alice,bob).
espionne(P,C):-
    pirate(P),
    communique(C,P).

