age(Name, Age).
citizen(Name, Years).

qualified(X, houseOfRepresentatives) :- (age(X, Age), Age >= 25), (citizen(X, Years), Years >= 7).