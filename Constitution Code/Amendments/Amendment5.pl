right(Citizen, notHeldAnswerable(Crime)) :- 
    (not(presentment(grandJury, Citizen));
    not(indictment(grandJury, Citizen));
    not(service(land, Citizen));
    not(service(naval, Citizen))).
    (member(Crime, [capitalCrime, infamousCrime])),
    (citizen(Citizen, Time), Time >= 0),
    

right(Citizen, putInJeopardy(twice(sameOfffence))) :- (citizen(Citizen, Time), Time >= 0).
right(Citizen, not(witness(against(Citizen)))) :- (citizen(Citizen, Time), Time >= 0).

right(Citizen, notDeprived(X)) :- 
    member(X, [life, liberty, peroperty, taken(withoutCompensation(privateProperty))]),
    (citizen(Citizen, Time), Time >= 0).