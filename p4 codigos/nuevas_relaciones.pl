% new_relations.pl (nombre inferido, para complementar family.pl)
grandparent(X,Z) :- parent(X,Y), parent(Y,Z).
grandmother(X,Z) :- mother(X,Y), parent(Y,Z).
grandfather(X,Z) :- father(X,Y), parent(Y,Z).

% Nota: La definición de wife(X,Y) en el slide implica que X (female) e Y (male)
% son padres del MISMO hijo Z. No que son esposos en un sentido general.
wife(X,Y) :- parent(X,Z), parent(Y,Z), female(X), male(Y).
uncle(X,Z) :- brother(X,Y), parent(Y,Z).