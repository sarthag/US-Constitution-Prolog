power(president, grant(reprieve(offenseAgainstUS))).
power(president, grant(pardon(offenseAgainstUS))).

adviceAndConsent(senate).
power(president, makeTreaties) :- adviceAndConsent(senate).
power(president, appoint(nominate(X))) :-
    member(X, [ambassador, minister, consul, judge(supremeCourt)]),
    adviceAndConsent(senate).

power(president, appoint(officers)).

recess(senate).
power(president, fill(vacancies)) :- recess(senate).
power(president, grant(commissions)) :- recess(senate).


commanderInChiefOfArmy(president).
commanderInChiefOfNavy(president).
commanderInChiefOfMilitia(president) :- inService(militia).

power(principalOfficer(Department), advice(president)).