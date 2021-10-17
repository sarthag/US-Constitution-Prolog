notCriminalRights ([excessiveBail,excessiveFines,cruelPunishments]).

notAllowed(X) :- member(X,notCriminalRights).

/*Checks if given action towards criminal is disallowed */