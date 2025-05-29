% family.pl
female(pam).
female(liz).
female(pat).
female(ann).

male(jim).
male(bob).
male(tom).
male(pete). % Pete es male aquí

parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(pete,jim).

mother(X,Y):- parent(X,Y), female(X).
father(X,Y):- parent(X,Y), male(X).
haschild(X):- parent(X,_).
sister(X,Y):- parent(Z,X), parent(Z,Y), female(X), X\==Y.
brother(X,Y):- parent(Z,X), parent(Z,Y), male(X), X\==Y.

% Variables según el slide 25:
% grandparent(Abuelo/a, Nieto/a)
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
% grandmother(Abuela, Nieto/a)
grandmother(X,Z) :- mother(X,Y), parent(Y,Z).
% grandfather(Abuelo, Nieto/a)
grandfather(X,Z) :- father(X,Y), parent(Y,Z).

% wife(Esposa, Esposo) - con la misma semántica de "padres del mismo hijo"
wife(X,Y) :- parent(X,Z), parent(Y,Z), female(X), male(Y).
% uncle(Tio, Sobrino/a)
uncle(X,Z) :- brother(X,Y), parent(Y,Z).