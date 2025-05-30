% mother_sister_rules.pl (nombre inferido)
mother(X,Y) :- parent(X,Y), female(X).
sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), X \== Y.