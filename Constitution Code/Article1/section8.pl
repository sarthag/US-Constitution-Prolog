power(congress, layAndCollect(tax)).
power(congress, layAndCollect(duties)).
power(congress, layAndCollect(imposts)).
power(congress, layAndCollect(excises)).

power(congress, spend(defense)).
power(congress, spend(welfare)).

power(congress, borrow(moneyOnCreditOf(theUs))).

power(congress, regulate(commerce(with(foreign(nationals))))).
power(congress, regulate(commerce(among(states)))).
power(congress, regulate(commerce(with(indianTribes)))).

power(congress, establish(uniform(rules(naturalization)))).
power(congress, establish(uniform(laws(bankrupcy)))).

power(congress, coin(currency)).
power(congress, regulate(value(currency))).
power(congress, regulate(exchangeRates(foreign(currency)))).

power(congress, punish(counterfeiting(securities))).
power(congress, punish(counterfeiting(currency))).

power(congress, establish(postOffices)).
power(congress, post(roads)).
power(congress, provide(limitedTime(exlusive(right(writings, authours))))).
power(congress, provide(limitedTime(exlusive(right(discoveries, inventors))))).

power(congress, provide(tribunals(congress))) :- inferior(tribunals(congress), tribunals(supremeCourt)).

power(congress, define(piracies(highSeas))).
power(congress, punish(piracies(highSeas))).
power(congress, define(felonies(highSeas))).
power(congress, punish(felonies(highSeas))).
power(congress, define(offences(lawOfNations))).
power(congress, punish(offences(lawOfNations))).

power(congress, declare(war)).
power(congress, grant(letters(marque))).
power(congress, grant(letters(marque))).
power(congress, grant(letters(reprosal))).
power(congress, grant(letters(reprosal))).
power(congress, make(rules(captures(land)))).
power(congress, make(rules(captures(water)))).

power(congress, raise(army)) :- (appropriation(money, Time), Time =< 2).
power(congress, support(army)) :- (appropriation(money, Time), Time =< 2).
power(congress, provide(navy)).
power(congress, maintain(navy)).

forces(land) :- army.
forces(naval) :- navy.
power(congress, make(rules(governmentAndRegulation(forces(land))))).
power(congress, make(rules(governmentAndRegulation(forces(naval))))).

power(congress, porvide(call(militia))).
call(militia) :- 
    execute(lawsOfUnion);
    surpress(insurrections);
    surpress(rebelInvations).
inService(militia) :- call(militia).
power(congress, provide(organizing(militia))).
power(congress, provide(arming(militia))).
power(congress, provide(disciplining(militia))).
power(congress, governing(militia)) :- inService(militia).
power(congress, appoint(ofiicers(militia))).
power(congress, prescribe(discipline(training(militia)))).

power(congress, exercise(exlusive(legislation(becomes(seat(government(theUS), district))))))
power(congress, exercise(authority(purchased(places)))) :- consent(legislation(state)).
power(congress, make(laws(necessaryAndProper(power(constitution))))).
