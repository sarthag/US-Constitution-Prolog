unRevokableRights ([freedom(speech),freedom(press),right(peacably(assemble)),petition(redress(grievances))]).
newLaw(Right) :- not(member(Right,unRevokableRights)).

/* Above statement checks whether the new law  
takes away the unrevokable rights */