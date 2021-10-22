citizen(amy, 5).
right(Citizen, notHeldAnswerable(Crime, unlessThey(X))) :- 
    (member(X, [presentment(grandJury), indictment(grandJury), service(land), service(naval)])),
    (member(Crime, [capitalCrime, infamousCrime])),
    (citizen(Citizen, Time), Time >= 0).
    
right(Citizen, putInJeopardy(twice(sameOfffence))) :- (citizen(Citizen, Time), Time >= 0).
right(Citizen, not(witness(against(Citizen)))) :- (citizen(Citizen, Time), Time >= 0).

right(Citizen, notDeprived(X)) :- 
    member(X, [life, liberty, peroperty, taken(withoutCompensation(privateProperty))]),
    (citizen(Citizen, Time), Time >= 0).