right(Citizen, not(held(answer(capitalCrime)))) :- 
    not(presentment(grandJury));
    not(indictment(grandJury));
    not(service(land));
    not(service(naval)).
right(Citizen, not(held(answer(imfamousCrime)))) :- 
    not(presentment(grandJury));
    not(indictment(grandJury));
    not(service(land));
    not(service(naval)).

right(Citizen, putInJeopardy(twice(sameOfffence))).
right(Citizen, not(witness(against(Citizen)))).

rightsDuringTrial = [life, liberty, peroperty, taken(withoutCompensation(privateProperty))].
right(Citizen, not(deprived(RightDuringTrial))) :- member(RightDuringTrial, rightsDuringTrial).


