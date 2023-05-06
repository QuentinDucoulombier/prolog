:-use_module(library(clpfd)).
%1.05

reverse(L, Rev):-
    reverseT(L,Rev,[]).

reverseT([],Rev,Acc) :-
    Rev = Acc.
reverseT([T|R],Rev, Acc):-
    reverseT(R ,Rev, [T|Acc]).

%3.04

gray(1,['0','1']).
gray(N,R) :-
    N #> 1,
    NM1 #= N-1,
    gray(NM1,RR),
    maplist(atom_concat('0'), RR, R1),
    reverse(RR,RV),
    maplist(atom_concat('1'),RV,R2),
    append(R1,R2,R).

%gray(3,L).
%01 > 10
%00 01 11 10 > 10 11 01 00
%000 001 011 010 110 111 101 100

%regarder corriger.