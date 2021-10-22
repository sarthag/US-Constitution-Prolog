
/* Name of Senator */
senator(Name).
/*No of senators per state*/
senatorsOfAnyState(stateOfUS(X),NumberOfSenators) :- stateOfUS(X), NumberOfSenators == 2.
/*tenure of the senator */

timeLapsed(StartYear, EndYear, Time):- 
    var(StartYear),number(EndYear),number(Time) -> StartYear is EndYear-Time;
    var(EndYear),number(StartYear),number(Time) -> EndYear is StartYear+Time;
    var(Time),number(StartYear),number(EndYear) -> Time is EndYear-StartYear;
    StartYear =:= EndYear - Time.



tenureOfSenator(senator(Name),YearOfStart,YearOfEnd):-(timeLapsed(YearOfStart,YearOfEnd,6)).
/* each senator has one vote */
vote(senator(Name),1). 
/*Term*/

tenure(class1, YearOfFirstElection, YearOfEnd) :- timeLapsed(YearOfFirstElection,YearOfEnd,2).
tenure(class2, YearOfFirstElection,YearOfEnd) :- timeLapsed(YearOfFirstElection,YearOfEnd,4).
tenure(class3, YearOfFirstElection,YearOfEnd) :- timeLapsed(YearOfFirstElection,YearOfEnd,6).

/* L resigns */
resign(L).
/*new senator if old senator resigns */
newSenator(NewSenator,OldSenator) :- resign(OldSenator).
power(executive,makeAppointments(newSenator)) :- resign(OldSenator).

/*Conditions to be a senator*/

qualified(X, senate) :- 
    (age(X, Age), Age >= 30), 
    (citizen(X, Years), Years >= 9).

exercise(LowerPower,HigherPower).
concurrence(House,Fraction). 

/* A can exercise the power of B */
exercise(A,B).
/* C presides over something */
preside(C).
/* D is tried in a court */
try(D).

/* E is absent */
absent(E).

/* choose F */
choose(F).

/* X is under oath or affirmation */
oathOrAffirmation(X).



/*powers of the senate and the president of the senate */
presidentOfSenate(vicePresident).
power(presidentOfSenate,vote) :- concurrence(senate, 0.5).
power(senate,choose(officers)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,choose(presidentProTempore)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,try(impeachment)) :- oathOrAffirmation(senate).


try(president) :- preside(chiefJustice).
convicted(Person,Fraction) :- (concurrence(senate, Fraction), Fraction > 0.666).
