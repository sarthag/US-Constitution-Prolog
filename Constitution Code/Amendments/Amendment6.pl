/* rights of accused */
right(Accused,speedyAndPublicTrial).
right(Accused, informedOfNatureAndCause(Accusation)).
right(Accused,confronted(witnessesAgainst)).
right(Accused,obtaining(witnessesFor)).
right(Accused,have(assistenceOfCounsel)).


/*Trial in same state or district where the crime has occured. */
placeOfCrime(DistrictOrState).

trial(NameOfAccused,CrimeDistrictOrState,TrialDistrictOrState) :- (placeOfCrime(CrimeDistrictOrState),CrimeDistrictOrState == TrialDistrictOrState).