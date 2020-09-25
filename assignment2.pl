people('Yes,LEC approved.'):-
((unemployed(yes);
hasDebt(yes)),
\+ ( lessThan25Years(yes),
parentRich(yes)),
\+ (have50KEuroOnSavings(yes);
earning100kEuroPerYear(yes))).

people('No,LEC not approved.'):-
\+ (unemployed(yes);hasDebt(yes));
(lessThan25Years(yes),parentRich(yes));
((unemployed(yes);hasDebt(yes)),
(have50KEuroOnSavings(yes);
earning100kEuroPerYear(yes)),\+ (lessThan25Years(yes),
parentRich(yes))).


people('Yes,LEC approved.'):- \+ people('No,LEC not approved.').
people('No,LEC not approved.'):- \+ people('Yes,LEC approved.').

unemployed(X):-ask(unemployed, X).
hasDebt(X):-ask(hasDebts, X).
earning100kEuroPerYear(X):-ask(earning100kEuroPerYear, X).
have50KEuroOnSavings(X):-ask(have50KEuroOnSavings, X).
lessThan25Years(X):-ask(lessThan25Years, X).
parentRich(X):-ask(parentRich, X).

:- dynamic(known/3).
:- discontiguous(ask/2).

ask(Attr, Val):- known(yes, Attr, Val), !.
ask(Attr, Val):- known(_, Attr, Val), !, fail.
ask(Attr, Val):- known(yes, Attr, V), V \== Val, !, fail.

ask(Attr, Val):-
write(Attr),
write('? '),
read(Ans),
asserta(known(Ans, Attr, Val)), Ans == yes.

go :- people(People), nl, nl, write(People), nl.






