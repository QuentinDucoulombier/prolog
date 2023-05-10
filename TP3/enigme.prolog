:- use_module(library(clpfd)).
createListe(L,NbLst,NbElt):-
    length(L,NbLst),
    createListe(L,NbElt).
createListe([],_).
createListe([L1|R],NbElt):-
    length(L1,NbElt),
    createListe(R,NbElt).

unicite(L):-
    member([n,_],L),
    member([c,_],L),
    member([b,_],L),
    member([f,_],L),
    member([a,_],L).

pb(M,Eau,Zebre):-
    createListe(M,5,5),
    maplist(unicite,M),
    faits(M),
    member(LZ,M),
    member([a,zebre],LZ),
    member([n,Zebre],LZ),
    member(LE,M),
    member([b,eau],LE),
    member([n,Eau],LE).
voisin(M,L1,L2):-
    nth1(I,M,L1),
    nth1(J,M,L2),
    abs(I-J) #= 1.

faits(M):-
    %Un voisin du fumeur de chesterfield a un renard,
    voisin(M,L15,L16),
    member([f,chesterfield],L15),
    member([a,renard],L16),
    
%Un voisin du fumeur de kool a un cheval.
    voisin(M,L17,L18),
    member([f,kool],L17),
    member([a,cheval],L18),
    %Le norvégien habite la première maison
    nth1(1,M,L1),
    member([n,norvegien],L1),
    %La maison à  coté de celle du norvégien est bleue
    voisin(M,L2,L1),
    member([n,norvegien],L1),
    member([c,bleue],L2),
    %L'habitant de la troisième maison boit du lait
    nth1(3,M,L4),
    member([b,lait],L4),
%L'anglais habite la maison rouge,
    member(L5,M),
    member([n,anglais],L5),
    member([c,rouge],L5),
%L'habitant de la maison verte boit du café,
    member(L6,M),
    member([b,cafe],L6),
    member([c,verte],L6),
%L'habitant de la maison jaune fume des kool
    member(L7,M),
    member([f,kool],L7),
    member([c,jaune],L7),
%La maison blanche se trouve juste après la verte
    nth1(I8,M,L8),member([c,blanche],L8),
    nth1(I9,M,L9),member([c,verte],L9),
    I8 #= I9+1,
%L'espagnol a un chien,
    member(L10,M),
    member([n,espagnol],L10),
    member([a,chien],L10),
%L'ukrainien boit du thé,
    member(L11,M),
    member([n,ukrainien],L11),
    member([b,the],L11),
%Le japonais fume des craven
    member(L12,M),
    member([n,japonais],L12),
    member([f,craven],L12),
%Le fumeur de old gold a un escargot,
    member(L13,M),
    member([f,oldgold],L13),
    member([a,escargot],L13),
%Le fumeur de gitane boit du vin,
    member(L14,M),
    member([f,gitane],L14),
    member([b,vin],L14).
