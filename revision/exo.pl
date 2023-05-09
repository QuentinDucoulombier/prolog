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

%ppcm(a,b)*pgcd =  A*B

pgcd(A,B,S):-
    A #< B,
    B1 #= B - A,
    pgcd(A,B1,S).

pgcd(A,B,S):-
    A #> B,
    pgcd(B,A,S).

pgcd(A,A,A).

ppcm(A,B,D):-

    pgcd(A,B,S),
    D #= A*B div S.

verifInf([T|R],I):-
    T #>= I,
    verifInf(R,I).

verifInf([],_).

verifSup([T|R],S):-
    T #=< S,
    verifSup(R,S).

verifSup([],_).

verifInfSup(L,I,S):-
    verifInf(L,I),
    verifSup(L,S).

/*
listeSuppr([T1|R1],L2,L):-
    member(T1, L2),
    append(L, T1),
    listeSuppr(R1,L2,L).

listeSuppr(L1,[T2|R2],L):-
    member(T2, L1),
    append(L, T2),
    listeSuppr(L1,R2,L).

listeSuppr([],[],[]).
*/

listeSuppr([],_,[]).

listeSuppr([T|R],L2,L3):-
    member(T,L2),
    listeSuppr(R,L2,L3).

listeSuppr([T|R],L2,[T|L3]):-
    not(member(T,L2)),
    listeSuppr(R,L2,L3).
    
add_tail([],Elt,[Elt]).
add_tail([T|R],Elt,[T|L]):-
    add_tail(R,Elt,L).

last(X,[X]).
last(X,[_|R]) :-
    last(X,[R]).


concatee(L,[],L).
concatee(L,[T|R],[T|L2]):-
    concatee(L,R,L2).

inv(L,R) :- 
    inv(L,[],R).
inv([],R,R).
inv([H|T],R,A) :- 
    inv(T,[H|R],A).


%test DS2018
listeImpairPair([],[],[]).
listeImpPair([A,B|R],[A|L2],[B|L3]):-
    listeImpairPair(R,L2,L3).

