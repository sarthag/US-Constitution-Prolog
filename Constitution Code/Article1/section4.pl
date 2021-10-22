/*para1*/
power(stateOfUS(X),make(electionRegulations)).
power(congress,alter(electionRegulations)).

/*meeting of the congress*/
monday(1,12,2020).

/* First monday of december */
meetingOfCongress(D,M,Y):- (monday(D,M,Y), M == 12 , D =< 7).



