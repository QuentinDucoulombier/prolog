:-use_module(library(clpfd)).

listeListeConcatenation([],L,L).
listeListeConcatenation([T1|R2], L2, [T1|R3]):-
    listeListeConcatenation(R2,L2,R3).

