:-use_module(library(clpfd)).

%1
valeAbs(L1,L2):-
    maplist(valAbs,L1,L2).
    %maplist(abs,L1,L2)
/*
Probleme avec abs pas pur
valAbs(Elt,Out):-
    Out #= abs(Elt).
ou*/
valAbs(Elt,Out) :-
    Elt #>= 0, Out #= Elt.
valAbs(Elt,Out) :-
    Elt #< 0, Out #= Elt.


%2
sommeValAbs(Liste,Res):-
    %valAbs(Liste,L2),
    foldl(plus,Liste,0,Res).

plus(E,Acc,Res):-
    Res #= Acc + abs(E).

%3


/*
tri_rapide(L,[TD|RD],[TF|RF]):-
    RD = [TRD|_],
    RF = [TRF|_],
    partition(part(TRD),L,RF,RD),
    tri_rapide(RD,TD,[TRD]),
    tri_rapide(RF,TF,[TRF]),
    append(L,RF,RD).
*/


tri_rapide([],[]).
tri_rapide(L,LS):-
    L = [P|R],
    partition(part(P),R,I,E),
    tri_rapide(I,IS),
    tri_rapide(E,ES),
%    append(IS,[P],L1),
%    append(L1,ES,LS).
%   version un peu + opti
    append(IS,[P|ES],LS).

part(Elt,TF):-
    Elt #>= TF.  

    