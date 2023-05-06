:-use_module(library(clpfd)).

my_last(X,[X|[]]).
my_last(X,L) :-
    L = [_|R],
    my_last(X,R).

my_last_but_one(T,[T|[_]]).
my_last_but_one(T,L):-
    L = [_|R], 
    my_last_but_one(T,R).

element_at(X,[X|_L],1).
element_at(Elt,[_X|L],N) :-
    NM1 #= N-1,
    element_at(Elt,L,NM1).

%1.04
count_elements([], 0).
count_elements(L, N) :-
    L = [_|R],
    N #= N1 + 1,
    count_elements(R, N1).
    
%1.05
reverse([],[]).
reverse([T|R], L) :-
    append(RR, [T], L),
    reverse(R,RR).
    
%1.06
palindrome(L1):-
    reverse(L1,X),
    L1=X.

%1.08
compress([],[]).
compress([X],[X]).
compress([A,A|R],L):-
    compress([A|R],L).
compress([A,B|R],[A|L]):-
    dif(A,B),
    compress([B|R],L).

%1.09
pack([],[]).
pack([V|R1], [P|S]):-
    pack2(V,R1,P,R2),
    pack(R2,S).
pack2(T,[],[T],[]).
pack2(X,[Y|RY],[X],[Y|RY]):-
    dif(X,Y).
pack2(X,[X|RX],[X|RY],RZ) :-
    pack2(X,RX,RY,RZ).



%Examen 2016
sommeListe([], 0).
sommeListe(L, N) :-
    L = [T|R],
    N #= N1 + T,
    sommeListe(R, N1).
    

