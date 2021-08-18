
:- use_module(library(pita)).

:- if(current_predicate(use_rendering/1)).
:- use_rendering(c3).
:- use_rendering(graphviz).
:- use_rendering(table,[header(['Multivalued variable index','Rule index','Grounding substitution'])]).
:- endif.

:- pita.

:- begin_lpad.

%% a:- b,c.
% a:- b,c,f,g.
% a:- d,e,h.

% b:0.3.
% abducible c.
% d:0.3.
% abducible e.
% abducible f.

% g:0.4.
% h:0.4.

% :- c,e.
% :- g,h.
% q:- a,b.
% q:- c,d.

% a:0.2.
% b:0.3.
% c:0.4.
% d:0.5.

% :- a,c.

% a:0.4. 
% b:0.3.

% abducible aa.
% abducible bb.

% q:- a,aa. 
% q:- b,bb.

% :- a,b.
vv1:0.3.
vv2:0.3.
vv3:0.3.
vv4:0.3.

% a:- f,\+e,vv1.
% % a:- f,\+e.
% a:- \+f,e,g,vv2.
% a:- \+f,e,g.

% abducible f.
% abducible e.
% abducible g.
% abducible h.
% abducible i.
% abducible l.

% a:- e,l.
% a:- f,\+i.
% a:- \+g,h.

% a:- \+f, vv1.
% a:- \+c,g.
% a:- \+c.
% a:- e, \+c.

% a:- vv1,e.
% a:- vv2,\+e.

% :- c,e.

%%%%%%%%%%%%%%
% qui l'unica dovrebbe essere g
% a:- vv1,\+c,f.
% a:- g.
% a:- vv2,c,e.

% questo mi fa vedere che ci serve il sottoinsieme stretto e non uguale
% a:- vv1,c.
% a:- g.

% a:- g,f,vv1.
% a:- c,e,vv2.

% :- g,c.

% questo mi fa vedere che non posso rimuovere sia 
% dominati da true che da false
% a:-g,c.
% a:-f,c.


%% altro test per capire che non va bene togliere da false verso true
% a:- f,g,a1,c.
% a:- \+f,a1,c.


% a:- \+f,g.
% a:- \+e,c.

% a:- f,vv1.
% a:- \+c,e,vv2.
% a:- g,vv3.

% :- f,e,g.

% a:- vv1,g.
% a:- vv2,f.

% a:- c.
% % a:- vv4,e.

% :- vv1,vv2.
% % :- vv3,vv4.

a:- g,vv1.
a:- f.
a:- c.

abducible g.
abducible f.
abducible c.
abducible e.
%%%%%%%%%%%%

%%%%%%%%%%%%%
% questo mi fa vedere che se è vuoto devo inserire, non posso
% non inserire nulla
% a:- a1,a2.
% a:- a3,a4.
% a:- a5,a6.

abducible a1.
abducible a2.
abducible a3.
abducible a4.
abducible a5.
abducible a6.
%%%%%%%%%%%%%%%%%

:- end_lpad.

test:-
    abd_prob(a,B,C),
    write('prob: '),
    writeln(B),
    stampa(C).

stampa([]).
stampa([H|T]):-
    writeln(H),
    stampa(T).
    

/** <examples>

Prob = 0.21304347826086942
Prob = 0.7869565217391304 con \+q

?- abd_prob(a,Prob,Exp).
?- abd_bdd_dot_string(a,BDD,Var,VarA,P,Exp).



*/
