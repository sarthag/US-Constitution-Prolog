stateOfUS(newHampshire).
stateOfUS(massachusetts).
stateOfUS(connecticut).
stateOfUS(newYork).
stateOfUS(newJersey).
stateOfUS(pennsylvania).
stateOfUS(delaware).
stateOfUS(maryland).
stateOfUS(virginia).
stateOfUS(northCarolina).
stateOfUS(southCarolina).
stateOfUS(georgia).
/* Name of Senator */
senator(Name).
/*No of senators per state*/
senatorsOfAnyState(stateOfUS(X),NumberOfSenators) :- stateOfUS(X), NumberOfSenators == 2.
/*tenure of the senator */
timeLapsed(StartYear,EndYear,Time) :- Time is (EndYear - StartYear)
tenure(senator(Name),YearOfStart,YearOfEnd):-(timeLapsed(YearOfStart,YearOfEnd,TimePeriod),TimePeriod=<6).
/* each senator has one vote */
vote(senator,1). 
/*Term*/

/*Try to make it in the format of list*/

tenure(class1, YearOfFirstElection,YearOfEnd) :- (timeLapsed(YearOfStart,YearOfEnd,TimePeriod),TimePeriod >= 0 ,TimePeriod=<2).
tenure(class2, YearOfFirstElection,YearOfEnd) :- (timeLapsed(YearOfStart,YearOfEnd,TimePeriod),TimePeriod >= 2,TimeTimePeriod=<4).
tenure(class3, YearOfFirstElection,YearOfEnd) :- (timeLapsed(YearOfStart,YearOfEnd,TimePeriod),TimePeriod >= 4,TimePeriod=<6).

senator(NewSenator) :- resign(OldSenator).
power(executive,makeAppointments(OldSenator,NewSenator))):- resign(OldSenator).

/*Conditions to be a senator*/

age(Name, Age).
citizen(Name, Years).
exercise(LowerPower,HigherPower).
concurrence(House,Fraction). 
qualified(X,senator):- (age(X,Age),Age >=30),(citizen(X,Years),Years>= 9).
presidentOfSenate(vicePresident).
power(presidentOfSenate(vicePresident),vote,Fraction) :- (concurrence(senate, Fraction), Fraction == 0.5).
power(senate,choose(officers)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,choose(presidentProTempore)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,try(impeachment)) :- oathOrAffirmation(senate).
try(president) :- preside(chiefJustice).
convicted(Person,Fraction) :- (concurrence(senate, Fraction), Fraction > 0.666).
