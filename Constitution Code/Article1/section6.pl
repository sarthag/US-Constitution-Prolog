compensation(houseMembers):- ascertained(law),paidFrom(treasuryOfUS).

privilegedFromArrest(Person, Crime) :- 
    member(Person, [senator, representative]), 
    not(member(Crime, [treason, felony, breachOfPeace])).
appointment(Person,civilOffice) :- not(member(Person,houseMembers)).