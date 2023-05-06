arc(a,b,2).
arc(b,a,3). %Pour faire la boucle
arc(a,g,6).
arc(b,e,2).
arc(b,c,7).
arc(g,e,1).
arc(g,h,4).
arc(e,f,2).
arc(f,c,3).
arc(f,h,2).
arc(c,d,3).
arc(h,d,2).
chemin(X,Y,[X,Y]) :- arc(X,Y,_).
%chemin(X,Y, [X|_]) :- arc(X,Z,_),
                      %chemin(Z,Y, [Z,Y]).
chemin(X,Y, [X|L]) :- arc(X,Z,_),
                      chemin(Z,Y,L).

%cycle :-
%    chemin(X,X,_).



iter_deep(X,Y,C):-
    length(C, _),
    chemin(X,Y,C).
    