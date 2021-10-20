not(takeEffect(law(varying(compensation(servicesOf(X)))))) :- 
    (intervened(election(X))),
    (member(X, [senator, representative])).
    