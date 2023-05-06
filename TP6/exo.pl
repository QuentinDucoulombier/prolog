:-use_module(library(clpfd)).
%regarder correction
sudoku(Rows) :-
    length(Rows, 9), maplist(same_length(Rows), Rows),
    append(Rows, Vs), Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    blocks(As, Bs, Cs),
    blocks(Ds, Es, Fs),
    blocks(Gs, Hs, Is).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
    all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
    blocks(Ns1, Ns2, Ns3).

%?- sudoku(R),maplist(label,R).
%f(T,L):- T =.. [_|L].
f(T,R):-
    T =.. L,
    L = [_|RInit],
    maplist(atom_to_var,RInit,R).

atom_to_var(N,N) :-
    dif(N,'_').
atom_to_var(A, _) :-
    A ='_'.
%?- csv_read_file('sudoku.csv',R,[match_arity(false),separator(0',)]),maplist(f,R,L).
lire_csv(Fichier,R,L) :-
    csv_read_file(Fichier,R,[match_arity(false)]),maplist(f,R,L).


%Q2
q2(S):-
    findall(P,pandigital(P),L),
    foldl(plus,L,0,S).

pandigital(P):-
    length(L,10),
    all_distinct(L),
    L ins 0..9,
    L = [_D1,D2,D3,D4,D5,D6,D7,D8,D9],
    