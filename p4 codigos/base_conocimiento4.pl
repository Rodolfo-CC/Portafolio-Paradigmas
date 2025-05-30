% kb4_brother.pl (nombre inferido)
parent(simon, pedro).
parent(simon, raj).
male(pedro).
male(raj).

brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X), male(Y).
% Para una definición más precisa de hermano (no ser hermano de sí mismo):
% brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X), male(Y), X \== Y.