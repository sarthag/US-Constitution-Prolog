vote(elector(stateOfUS(X)), presidentialCandidate(stateOfUS(Y)),vicepresidentialCandidate(stateOfUS(Z))) :-
    X\=Y;X\=Z.
  transmit([seal(list(presidentialCandidates,votesForThem)),seal(list(vicepresidentialCandidates,votesForThem))], govtOfUS).
  fractVote(PresCand,FractionVotes).
  president(fractVote(PresCand,MaxFractionVotes)) :- MaxFractionVotes>0.5.
  noMajorityProcedure :- fractVote(Cand,MaxFractionVotes), MaxFractionVotes<0.5.
  candidateNoMajority(X) :- member(X, [fractVote(Cand1,Max1FractionVotes),fractVote(Cand2,Max2FractionVotes), fractVote(Cand3,Max3FractionVotes)]), noMajorityProcedure.
  vote(houseOfRepresentatives,stateOfUS(Y), candidateNoMajority(X), Vote) :-
    member(X, [fractVote(Cand1,Max1FractionVotes),fractVote(Cand2,Max2FractionVotes), fractVote(Cand3,Max3FractionVotes)]), 
    (Vote=PresCand1;
    Vote=PresCand2;
    Vote=PresCand3).
  fractVoteP(PresCand,FractionVotes).
  vote(senate, stateOfUS(X), candidatesNoMajority(X) , Vote) :-
    member(X, [fractVote(VPCand1,Max1FractionVotes),fractVote(VPCand2,Max2FractionVotes)]),
    (Vote=VPCand1;
    Vote=VPCand2).
  fractVoteVP(VPCand,FractionVotes).
  president(PresCand) :- fractVoteP(PresCand,FractionVotes), FractionVotes>0.5.
  vicePresident(PresCand) :- fractVoteVP(VPCand,FractionVotes), FractionVotes>0.5.
