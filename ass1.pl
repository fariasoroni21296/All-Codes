

parent(george,elizabeth).
parent(mum,elizabeth).

parent(george,margaret).
parent(mum,margaret).

parent(spencer,diana).
parent(kydd,diana).

parent(philip,charles).
parent(elizabeth,charles).

parent(philip,anne).
parent(elizabeth,anne).

parent(philip,andrew).
parent(elizabeth,andrew).

parent(philip,edward).
parent(elizabeth,edward).

parent(charles,william).
parent(diana,william).

parent(charles,harry).
parent(diana,harry).

parent(mark,peter).
parent(anne,peter).

parent(mark,zara).
parent(anne,zara).

parent(andrew,beatrice).
parent(sarah,beatrice).

parent(andrew,eugenie).
parent(sarah,eugenie).


male(george).
male(spencer).
male(philip).
male(charles).
male(andrew).
male(mark).
male(edward).
male(christ).
male(charles).
male(william).
male(harry).
male(peter).
male(eugenie).


female(mum).
female(kydd).
female(elizabeth).
female(margaret).
female(diana).
female(anne).
female(sarah).
female(zara).
female(beatrice).


father(F,C):-parent(F,C),male(F).
mother(M,C):-parent(M,C),female(M).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.
wife(X,Y):-parent(X,Z),parent(Y,Z),female(X),male(Y).
husband(X,Y):-parent(X,Z),parent(Y,Z),male(X),female(Y).

grandchild(X,Y):-parent(Z,X),parent(Y,Z).
fatherinlaw(X,Y):-father(X,Z),wife(Y,Z),husband(Y,Z).
motherinlaw(X,Y):-mother(X,Z),wife(Y,Z),husband(Y,Z).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
greatgrandparent(X,Y) :- parent(X,D), parent(D,F), parent(F,Y).

brotherInLaw(X,Y):-husband(M,Y),brother(X,M).

sisterInLaw(X,Y):-husband(M,Y),sister(X,M).
firstCousin(X,Y):-parent(M,Y),sister(Z,M),parent(Z,X).
