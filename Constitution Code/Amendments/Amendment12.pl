vote(Elector(stateOfUS(X)), PresCand(stateOfUS(Y)),VicePresCand(stateOfUS(Z))) :-
  X\=Y;X\=Z.
transmit([seal(list(presidentialCandidates,votesForThem)),seal(list(vicepresidentialCandidates,votesForThem))], govtOfUS).
fractVote(PresCand,FractionVotes).
president(fractVote(PresCand,MaxFractionVotes)) :- MaxFractionVotes>0.5.
noMajProcedure :- fractVote(Cand,MaxFractionVotes), MaxFractionVotes<0.5.
candidatesNoMaj[fractVote(Cand1,Max1FractionVotes),fractVote(Cand2,Max2FractionVotes), fractVote(Cand3,Max3FractionVotes)] :- noMajProcedure.
vote(houseOfRepresentatives,stateOfUS(X), candidatesNoMaj[fractVote(PresCand1,Max1FractionVotes),fractVote(PresCand2,Max2FractionVotes), fractVote(PresCand3,Max3FractionVotes)] , Vote) :-
  Vote=PresCand1;
  Vote=PresCand2;
  Vote=PresCand3.
fractVoteP(PresCand,FractionVotes).
vote(senate, stateOfUS(X), candidatesNoMaj[fractVote(VPCand1,Max1FractionVotes),fractVote(VPCand2,Max2FractionVotes), fractVote(VPCand3,Max3FractionVotes)] , Vote) :-
  Vote=VPCand1;
  Vote=VPCand2.
fractVoteVP(VPCand,FractionVotes).
president(PresCand) :- fractVoteP(PresCand,FractionVotes), FractionVotes>0.5.
vicePresident(PresCand) :- fractVoteVP(VPCand,FractionVotes), FractionVotes>0.5.
