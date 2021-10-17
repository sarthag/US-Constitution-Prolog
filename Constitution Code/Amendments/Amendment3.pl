not(quarted(soldier, house(Citizen))) :- 
    (peace;
    (consent(Citizen), (citizen(Citizen, Time), Time >= 0))),
    perscribed(byLaw).