power(president, grant(reprieve(offenseAgainstUS))) :- not(impeachment).
power(president, grant(pardon(offenseAgainstUS))) :- not(impeachment).

power(president, makeTreaties) :- adviceAndConsent(senate).
power(president, appoint(nominate(ambassador))) :- adviceAndConsent(senate).
power(president, appoint(nominate(minister))) :- adviceAndConsent(senate).
power(president, appoint(nominate(consul))) :- adviceAndConsent(senate).
power(president, appoint(nominate(judge(supremeCourt)))) :- adviceAndConsent(senate).

/*Appoint Officers*/

power(president, fill(vacancies)) :- recess(senate).
power(president, grant(commissions)) :- recess(senate).
/*Commisions shall expire*/

commanderInChiefOfArmy(president).
commanderInChiefOfNavy(president).
commanderInChiefOfMilitia(president) :- inService(militia).


/* Requieres opinion of respective Head of Departments*/

power(principalOfficer(Department), advice(president)).
%Ammendment 25%
vicePresident=president :- death(president); resignation(president);removalFromOffice(president). 
