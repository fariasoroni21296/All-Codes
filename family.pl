male(harry).
male(ron).
male(percy).
male(fred).
male(george).
male(arthur).
male(james).
male(wendell).
male(ford).
male(walker).
male(douglas).
male(vernon).
male(dudley).

female(hermione).
female(molly).
female(monica).
female(lilly).
female(ginny).
female(fay).
female(whitney).
female(kyla).
female(petunia).

friend(harry,ron).
friend(ron,harmione).
friend(harmione,harry).
friend(X,Y):-
friend(Y,X).

age(19,harry).
age(19,hermione).
age(18,ron).
age(35,james).
age(37,wendell).
age(42,arthur).
age(33,lilly).
age(38,monica).
age(40,molly).
age(21,fred).
age(21,george).
age(23,percy).
age(15,ginny).
age(95,ford).
age(87,fay).
age(82,whitney).
age(75,walker).
age(85,douglas).
age(81,kyla).
age(38,vernon).
age(35,petunia).
age(20,dudley).

parent(james,harry).
parent(lilly,harry).
parent(molly,ron).
parent(molly,fred).
parent(molly,george).
parent(molly,percy).
parent(molly,ginny).
parent(arthur,ron).
parent(arthur,fred).
parent(arthur,george).
parent(arthur,percy).
parent(arthur,ginny).
parent(wendell,hermione).
parent(monica,hermione).
parent(douglas,vernon).
parent(kyla,vernon).
parent(vernon,dudley).
parent(petunia,dudley).
parent(ford,arthur).
parent(fay,arthur).
parent(whitney,wendell).
parent(walker,wendell).
parent(douglas,james).
parent(kyla,james).

father(F,C):-
parent(F,C),
male(F).

mother(M,C):-
parent(M,C),
female(M).

brother(X,Y):-
parent(Z,X),
parent(Z,Y),
male(X),
X\==Y.

sister(X,Y):-
parent(Z,X),
parent(Z,Y),
female(X),
X\==Y.

sibling(X,Y):-
parent(Z,X),
parent(Z,Y),
X\==Y.

grandparent(X,Y):-
parent(X,Z),
parent(Z,Y).

grandfather(X,Y):-
father(X,Z),
parent(Z,Y).

grandmother(X,Y):-
mother(X,Z),
parent(Z,Y).

wife(X,Y):-
parent(X,Z),
parent(Y,Z),
female(X),
male(Y).

husband(X,Y):-
parent(X,Z),
parent(Y,Z),
male(X),
female(Y).

uncle(X,Z):-
brother(X,Y),
parent(Y,Z).

aunt(X,Y):-
wife(X,Z),
uncle(Z,Y).

fatherinlaw(X,Y):-
father(X,Z),
wife(Y,Z);husband(Y,Z).

motherinlaw(X,Y):-
mother(X,Z),
wife(Y,Z);husband(Y,Z).

older(X,Y):-
age(M,X),
age(N,Y),
(M>N->true;false).

younger(X,Y):-
age(M,X),
age(N,Y),
(M<N->true;false).

sameAge(X,Y):-
age(M,X),
age(N,Y),
(M=N->true;false).







