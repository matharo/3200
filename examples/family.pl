female(qin).
female(lorna).
female(jing).
female(ying).

male(john).
male(kirby).
male(jackson).

parent(qin, lorna).
parent(john,lorna).

cousin(lorna,jing).
cousin(lorna,ying).
cousin(lorna,jackson).

cousin(kirby,X) :- cousin(lorna,X).
parent(X,kirby) :- parent(X,lorna).

sibling(X,X) :- parent(X,kirby), parent(X,lorna).

descend(X,Y) :- parent(X,Y).
descend(X,Y) :- parent(Z,Y),descend(X,Z).

ancestor(A,D,[A]):-parent(A,D).
ancestor(A,D,[X|Z]):-parent(X,D),ancestor(A,X,Z).
