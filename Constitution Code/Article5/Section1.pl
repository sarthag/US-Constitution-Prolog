call(congress, convention(proposingAmendments)):- 
    propose((twoThirds(senate),twoThirds(houseOfRepresentatives)), amendments);
    applied(legislature(twoThirds(statesOfUS))).
valid(amendment):- 
    (ratified(legislature(threeFourth(statesOfUS)));
     ratified(convention(threeFourth(statesOfUS)))).

*/ Provided that no Amendment which may be made prior to the Year One thousand eight hundred and
*/ eight shall in any Manner affect the fi rst and fourth Clauses
*/ in the Ninth Section of the fi rst Article; and that no State,
*/ without its Consent, shall be deprived of its equal Suffrage in the Senate. /*
