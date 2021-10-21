appropriation(money, 1).
rebelInvations.

power(congress, layAndCollect(X)) :- 
    member(X, [tax, duties, imposts, excises]).

power(congress, spend(X)) :- 
    member(X, [defense, welfare]).

power(congress, borrow(moneyOnCreditOf(theUs))).

power(congress, regulate(commerce(X))) :-
    member(X, [with(foreign(nationals)), among(states), with(indianTribes)]).

power(congress, establish(uniform(X))) :-
    member(X, [rules(naturalization), laws(bankrupcy)]).

power(congress, coin(currency)).
power(congress, regulate(X)) :-
    member(X, [value(currency). exchangeRates(foreign(currency))]).

power(congress, punish(counterfeiting(X))) :-
    member(X, [securities, currency]).

power(congress, establish(postOffices)).
power(congress, post(roads)).
power(congress, provide(limitedTime(exlusive(X)))) :-
    member(X, [right(writings, authours), right(discoveries, inventors)]).

inferior(tribunals(congress), tribunals(supremeCourt)).
power(congress, provide(tribunals(congress))).

power(congress, define(piracies(highSeas))).
power(congress, punish(piracies(highSeas))).
power(congress, define(felonies(highSeas))).
power(congress, punish(felonies(highSeas))).
power(congress, define(offences(lawOfNations))).
power(congress, punish(offences(lawOfNations))).

power(congress, declare(war)).
power(congress, grant(letters(X))) :-
    member(X, [marque, reprosal]).
power(congress, make(rules(captures(X)))) :-
    member(X, [land, water]).

power(congress, raise(army)) :- (appropriation(money, Time), Time =< 2).
power(congress, support(army)) :- (appropriation(money, Time), Time =< 2).
power(congress, provide(navy)).
power(congress, maintain(navy)).

forces(land) :- army.
forces(naval) :- navy.
power(congress, make(rules(governmentAndRegulation(forces(land))))).
power(congress, make(rules(governmentAndRegulation(forces(naval))))).

power(congress, porvide(call(militia))).

conditionsOfsupression(X) :- member(X,[insurrections,rebelInvasions]).
surpress(insurrections) :- insurrections.
surpress(rebelInvations) :- rebelInvations.
supress(X) :- conditionsOfsupression(X).
call(militia) :- 
    execute(lawsOfUnion);
    surpress(insurrections);
    surpress(rebelInvations).
inService(militia) :- call(militia).
power(congress, provide(X)) :-
    member(X, [organizing(militia), arming(militia), disciplining(militia)]).
power(congress, governing(militia)) :- inService(militia).
power(congress, appoint(ofiicers(militia))).
power(congress, prescribe(discipline(training(militia)))).

power(congress, exercise(exlusive(legislation(becomes(seat(government(theUS), district)))))).
power(congress, exercise(authority(purchased(places)))) :- consent(legislation(state)).
power(congress, make(laws(necessaryAndProper(power(constitution))))).