
houseMembers([senators,representatives]).
crimes([treason,felony,breachOfPeace]).

/*compensation(houseMembers):- ascertained(law),paidFrom(treasuryOfUS).*/

privilegedFromArrest(Person,Crime) :- member(Person,houseMembers), not(member(Crime,crimes)).
appointment(Person,civilOffice) :- not(member(Person,houseMembers)).


