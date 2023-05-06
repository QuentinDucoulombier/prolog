homme(albert).
homme(jean).
homme(paul).
homme('Paul').
homme(bertrand).
homme(louis).
homme(benoit).
femme(germaine).
femme(christiane).
femme(simone).
femme(marie).
femme(sophie).

% nommer les prédicats arg1_arg2_..._argn donc NE PAS avoir un prédicat pere(arg1,arg2)
pere_enfant(albert,jean).   
pere_enfant(jean,paul).
pere_enfant(paul,bertrand).
pere_enfant(paul,sophie).
pere_enfant(jean,simone).
pere_enfant(louis,benoit).
mere_enfant(germaine,jean).
mere_enfant(christiane,simone).
mere_enfant(christiane,paul).
mere_enfant(simone,benoit).
mere_enfant(marie,bertrand).
mere_enfant(marie,sophie).


parent_enfant(P,E) :-
    pere_enfant(P,E).
parent_enfant(P,E) :-
    mere_enfant(P,E).

fils_parent(F,P):-
    parent_enfant(P,F),
    homme(F).
fille_parent(F,P):-
    parent_enfant(P,F),
    femme(F).

gmpe(GM,PE):-
    femme(GM),
    parent_enfant(GM,P),
    parent_enfant(P,PE).

sfos(S,FOS):-
    parent_enfant(P,S),
    femme(S),
    parent_enfant(P,FOS).



voleur(pierre).

aime(marie,vin).
aime(pierre,A) :- 
    aime(A,vin).

vol(X,Y) :-
    aime(X,Y),
    voleur(X).

% Juste pour faire beau en gros
qui_vole_quoi :- vol(Qui, Quoi),
                 write(Qui),
                 write(' vole '),
                 write(Quoi).

