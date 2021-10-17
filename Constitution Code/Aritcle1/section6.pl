senators.
representatives.
holding(office).
treason.
felony.
houseMembers :- (senators;representatives),not(holding(office)).
crimes :- treason;felony;breachOfPeace.
compensation(houseMembers):- ascertained(law),paidFrom(treasuryOfUS).

privilegedFromArrest(houseMembers) :- not(crimes).
appointment(civilOffice) :- not(houseMembers).


