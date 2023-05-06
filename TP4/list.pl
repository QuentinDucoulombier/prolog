:-use_module(library(clpfd)).
%1.01
my_last(T,[T|[]]).
my_last(T,L):-
    L = [_|R], %au moins un
    my_last(T,R).

%?- my_last(X,[a,b,c,d]).
%verification dans l'autre sens
%my_last(a,L).
%my_last(a,[b,c,a]).
%my_last(X,L).

%1.02
my_last_but_one(T,[T|[_]]).
my_last_but_one(T,L):-
    L = [_|R], 
    my_last_but_one(T,R).

%1.03 et 1.04 deja fait (cf cours p20)
%1.03
element_at(X,[X|_L],1).
element_at(Elt,[_X|L], N):-
    N1 #= N-1,
    element_at(Elt,L, N1).


%1.05
%version - opti
%reverse([],[]).
%reverse([T|R],Rev) :-
%    reverse(R,RR),
%    append(RR,[T],Rev).

%version + opti
reverse(L, Rev):-
    reverseT(L,Rev,[]).

reverseT([],Rev,Acc) :-
    Rev = Acc.
reverseT([T|R],Rev, Acc):-
    reverseT(R ,Rev, [T|Acc]).
    
%1.06
palindrome(L1) :-
    reverse(L1,L2),
    L2=L1.

%1.08/1.09/1.10/1.11 Meme exo

%1.08
compress([],[]).
compress([X],[X]).
compress([A,A|R], S):-
    compress([A|R], S).
compress([A,B|R], [A|S]):-
    dif(A,B),
    compress([B|R], S).

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

%1.11
encode([],[]).
encode(L,RLE) :-
    pack(L,LP),
    maplist(conv,LP,RLE).

conv(Pack,Codage):-
    length(Pack, N),
    N #\= 1,    
    Pack=[V|_],
    Codage=[N,V].
    
conv(Pack,Codage):-
    length(Pack,1),
    Pack=[V|_],
    Codage= V.
        
%1.10
encode_not([],[]).
encode_not(L,RLE) :-
    pack(L,LP),
    maplist(conv2,LP,RLE).

conv2(Pack,Codage):-
    length(Pack, N),
    Pack=[V|_],
    Codage=[N,V].
    


%nvx ds
listeImpairPair(L,P,I):-
    partition(pair, L, P, I).
    
pair(Elt):-
    Elt mod 2 #= 0.


