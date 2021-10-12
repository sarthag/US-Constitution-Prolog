age(Name, Age).
citizen(Name, Years).

executivePower(president).
/* Term of Power */

 
/*
Elections
*/

qualified(X, president) :- (age(X, Age), Age >= 35), (citizen(X, Years), Years >= 14).
/* Natural Born Citizen */


