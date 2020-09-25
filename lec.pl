people('Yes, You Will Get LEC'):-
((unemployed(yes);
hasDebts(yes)),
\+ ( lessThanTwentyFiveYears(yes),
parentIsRich(yes)),
\+ (fiftyKEuroOnSavingAccount(yes);
earning100kEuroPerYear(yes))).

people('No, You Will Not Get Any LEC'):-
\+ (unemployed(yes);hasDebts(yes));
(lessThanTwentyFiveYears(yes),parentIsRich(yes));
((unemployed(yes);hasDebts(yes)),
(fiftyKEuroOnSavingAccount(yes);
earning100kEuroPerYear(yes)),\+ (lessThanTwentyFiveYears(yes),
parentIsRich(yes))).


people('Yes, You Will Get LEC'):- \+ people('No, You Will Not Get Any LEC').
people('No, You Will Not Get Any LEC'):- \+ people('Yes, You Will Get LEC').

unemployed(X):-ask(unemployed, X).
hasDebts(X):-ask(hasDebts, X).
earning100kEuroPerYear(X):-ask(earning100kEuroPerYear, X).
fiftyKEuroOnSavingAccount(X):-ask(fiftyKEuroOnSavingAccount, X).
lessThanTwentyFiveYears(X):-ask(lessThanTwentyFiveYears, X).
parentIsRich(X):-ask(parentIsRich, X).

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






