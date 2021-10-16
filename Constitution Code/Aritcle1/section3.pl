/*No of senators*/
/*%% Term*/ 

/*Conditions to be a senator*/

age(Name, Age).
citizen(Name, Years).
exercise(LowerPower,HigherPower).
concurrence(House,Fraction). 
qualified(X,senator):- (age(X,Age),Age >=30),(citizen(X,Years),Years>= 9).
presidentOfSenate(vicePresident).
power(presidentOfSenate(vicePresident),vote,Fraction) :- (concurrence(senate, Fraction), Fraction == 1/2).
power(senate,choose(officers)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,choose(presidentProTempore)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,try(impeachment)) :- oathOrAffirmation(senate).
try(president) :- preside(chiefJustice).
convicted(Person,Fraction) :- (concurrence(senate, Fraction), Fraction > 2/3).



