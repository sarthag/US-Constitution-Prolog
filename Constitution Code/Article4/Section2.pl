rightsAndPriviliges(citizen, State1) :- rightsAndPriviliges(citizen, State2).

removed(citizen, StateB):-
    (charged(citizen, treason, StateA);
     charged(citizen, felony, StateA);
     charged(citizen, otherCrime, StateA)),
    found(citizen, StateB),
    demand(executiveAuthority(StateA), delivered(citizen, StateA)).
    
*/ [No Person held to Service or Labour in one State, under the Laws thereof, escaping into another, shall,
*/in Consequence of any Law or Regulation therein, be discharged from such Service or Labour, but shall be 
*/delivered up on Claim of the Party to whom such Service or Labour may be
*/due.]     
    
