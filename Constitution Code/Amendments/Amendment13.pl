/* SECTION 1 */

exist(slavery, usJurisdiction) :-
    punishment(crime, dulyConvicted(party)).

exist(involuntaryServitude, usJurisdiction) :-
    punishment(crime, dulyConvicted(party)).

/* SECTION 2 */

power(congress, enforceArticle(legislation))