:-use_module(library(clpfd)).

%1
my_last(T,[T|[]]).
my_last(T,L):-
    L=[_|R],
    my_last(T,R).
%2
my_lbo(T,[T|[_]]).
my_lbo(T,L):-
    L=[_|R],
    my_lbo(T,R).
%3
element_at(X,[X|_L],1).
element_at(Elt,[_X|L],N):-
    N1 #= N-1,
    element_at(Elt,L,N1).
%4

%5
my_reverse([],[]).
my_reverse([T|R],Rev):-
    my_reverse(R,RR),
    append(RR,[T],Rev).

%
my_reverse_opt(L,R):-
    my_reverse_acc(L,R,[]).

my_reverse_acc([],Rev,Acc):-
    Rev = Acc.

my_reverse_acc([T|R],Rev,Acc):-
    my_reverse_acc(R,Rev,[T|Acc]).
    
%8
compress([],[]).
compress([E],[E]).
compress([T,Y|R],[T|Z]):-
    dif(T,Y), %car T et Y pourraint etre égaux 
    compress([Y|R],Z).
compress([T,T|R],Z):-
    compress([T|R],Z).

%9
pack([],[]).
pack([V|R1],[P|S]):-
    pack2(V,R1,P,R2),
    pack(R2,S).

pack2(V,[],[V],[]).
pack2(V1,[V2|R],[V1],[V2|R]):-dif(V1,V2).
pack2(V,[V|R],[V|P],R2):-
    pack2(V,R,P,R2).

%10 et 11
encode(L,RLE):-
    pack(L,LP),
    maplist(conv,LP,RLE).

conv(Pack,Codage):-
    Pack=[Z|_],
    N #\= 1,
    Codage=[N,Z],
    length(Pack,N).

conv(Pack,Codage):-
    Pack=[Z|_],
    Codage=Z,
    length(Pack,1).

%arithmetic

%2.1
is_prime(2).
is_prime(N):-
    N #> 2,
    NM1 #= N-1,
    non_div(N,NM1).

non_div(N,2):- N mod 2#\= 0.
non_div(N,M):-
    N mod M #\= 0,
    NM1 #= M-1,
    non_div(N,NM1).

%2.4
list_of_prime(X,Y,[]):-
    X #> Y.
list_of_prime(MIN,MAX,Res):-
    %MIN #<= MAX,
    is_prime(MIN),
    Res = [MIN|L],
    Z #= MIN+1,
    list_of_prime(Z,MAX,L).
list_of_prime(MIN,MAX,Res):-
    %MIN #<= MAX,
    Z #= MIN+1,
    list_of_prime(Z,MAX,Res).

%2.5
goldbach(N,X):-
    greater_p(N,R),
    T #= N-R,
    X = [R,T].

greater_p(3,3).
greater_p(N,Res):-
    is_prime(N),
    Res #= N.
greater_p(N,Res):-  
    T #= N-1,
    greater_p(T,Res).

%2.7
gcd(X,Y,Res):-
    X #>= Y,
    Y #= 0,
    Res #= X.
gcd(X,Y,Res):-
    X #>= Y,
    Temp #= X mod Y,
    gcd(Y,Temp,Res).

%3.4
gray(1,['0','1']).
gray(N,R):-
    N #> 1,
    NM1 #= N-1,
    gray(NM1,RR),
    maplist(atom_concat('0'),RR,R1),
    reverse(RR,RV),
    maplist(atom_concat('1'),RV,R2),
    append(R1,R2,R).


%-----------DS--------------



listeConcat([],L,L).
listeConcat([T1|R1],L2,[T1|R3]):-listeConcat(R1,L2,R3).


%-------------------

decode([1,C],[C]).
decode([N,C],R):-
    Z #= N-1,
    R = [C|Res],
    decode([Z,C],Res).

coun(C,C,N,N1):-
    N1 #= N + 1.

decodeBis([N,C],R):-
    foldl(coun(C),R,0,N).

uncompress(L,X):-
    maplist(decode,L,L1),
    flatten(L1, X).

%-----------------

test(Liste):-
    maplist(compare,Liste).

compare(X):-
    X #> 10.

%--------------

renverser(Liste,Res):-
    scanl(temp,Liste,[],Res).

temp(E,Acc,Res):-
    Res = [E|Acc].

%-------------------

somme(Liste,Res):-
    foldl(plus,Liste,0,Res).
    %parcourer chaque element de la liste en appliquant un predicat avec un accumulateur

plus(E,Acc,Res):-
    Res #= Acc + E.

%--------------



longueur(0,0).
longueur(N,1):-
    N #< 10.
longueur(N,Res):-
    Z #= N div 10,
    Res #= Res1 + 1,
    longueur(Z,Res1).


%-------nouveau-ds-----

q1([],[],[]).

q1(L1,L2,L3):-
    length(L1,LL),
    LL mod 2 #= 0,
    L1 = [T1|Res1],
    L2 = [T1|Res2],
    q1(Res1,Res2,L3).

q1(L1,L2,L3):-
    length(L1,LL),
    LL mod 2 #\= 0,
    L1 = [T1|Res1],
    L3 = [T1|Res3],
    q1(Res1,L2,Res3).


test(X,Res):-
    findall(X,pp(X,4),Res).


pp(X,X).