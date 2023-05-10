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
listeImpPair([],[],[]).
listeImpPair([T],[T],[]).
listeImpPair([A,B|R],[A|L2],[B|L3]):-
    listeImpPair(R,L2,L3).

/*
listeMoit([],[],[]).
%listeMoit([T],[T],[]).
listeMoit([T|R],[T|L1],L2):-
    length(R,N1),
    length(L1,N2),
    dif(N1,N2),
    listeMoit(R,L1,L2).
listeMoit([T|R],L1,[T|L2]):-
    length([T|R],N1),
    length(L2,N2),
    N3 = N1 div 2;
    dif(N3,N2),
    listeMoit(R,L1,L2).
*/

liste_premiereMoitie_deuxiemeMoitie(L1, L2, L3) :-
    length(L1, Len),
    HalfLen0 #= Len - Len mod 2,
    HalfLen #= HalfLen0 // 2,
    split(L1, HalfLen, L2, L3).

split(L, N, L1, L2) :-
    length(L1, N),
    append(L1, L2, L),
    length(L2, N).

    
listeSupp([T|R],Elt,L):-
    T = Elt,
    listeSupp(R,Elt,L).

listeSupp([T|R],Elt,[T|L]):-
    dif(Elt,T),
    listeSupp(R,Elt,L).

listeSupp([],_,[]).


entier_facto(N,R):-
    entier_factorielle(N,1,R).

entier_factorielle(0, Acc, Acc).
entier_factorielle(N, Acc, R) :-
    N #> 0,
    NewAcc #= N * Acc,
    NewN #= N - 1,
    entier_factorielle(NewN, NewAcc, R).


%
borneSupInf([],_,_).
borneSupInf([T|R],S,I):-
    T #=< S,
    T #>= I,
    borneSupInf(R,S,I).

listRed([],_,[]).
listRed([T|R],L,[T|L1]):-
    not(member(T, L)),
    listRed(R,L,L1).
listRed([T|R],L,L1):-
    member(T,L),
    listRed(R,L,L1).
    

is_prime(N):-
    M #= N-1,
    non_div(N,M).

non_div(N,2):-
    N mod 2 #\= 0.
non_div(N,M):-
    N mod M #\= 0,
    MM1 #= M-1,
    non_div(N,MM1). 

touslespremier(X,Y):-
    between(2, Y, X),
    is_prime(X).

/*
construire(N,I):-
    is_prime(N),
    findall(X,touslespremier(X,N),L),
    length(L,T),
    I #= T.
*/



/*
construire(N, [M | L]) :-
    M #= N - 1,
    is_prime(M),
    M > 1,
    construire(M, L).
construire(N, []) :-
    N =< 1.
*/
niemeElement([T|_],1,T).
niemeElement([_|R],N,Elt):-
    M #= N-1,
    niemeElement(R,M,Elt).