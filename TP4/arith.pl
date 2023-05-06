:-use_module(library(clpfd)).

%2.1 ca marche pas
is_prime(2).
is_prime(N) :-
    N #>2,
    NM1 #= N-1,
    non_div(N,NM1).


non_div(N,2) :-
    N mod 2 #\= 0.
non_div(N,M) :-
    N mod M #\= 0,
    MM1 #= M-1,
    non_div(N,MM1). 

%2.04
prime_list(Low,Up,[]) :-
    Low #> Up.
    
prime_list(Low,Up,R):-
    Low #=< Up,
    is_prime(Low),
    LowP1 #= Low+1,
    prime_list(LowP1,Up,RR),
    R = [Low|RR].

prime_list(Low,Up,R):-
    Low #=< Up,
    not(is_prime(Low)),
    LowP1 #= Low+1,
    prime_list(LowP1,Up,RR),
    R = RR.

%2.05
goldbach(N,[X,Y]) :-
    prime_list(2,N,L),
    member(X,L),
    member(Y,L),
    X+Y #= N.


goldbach2(N,[X,Y]) :-
    N mod 2 #= 0,
    goldbach_opti(2,N,[X,Y]).

goldbach_opti(I,N,[I,J]) :-
    is_prime(I),
    J #= N-I,
    is_prime(J).

goldbach_opti(I,N,[X,Y]) :-
    I #\= N,
    IP1 #= I+1,
    goldbach_opti(IP1,N,[X,Y]).


%2.07
gcd(A,0,A).
gcd(A,B,G) :-
    C #= A mod B,
    gcd(B,C,G).
