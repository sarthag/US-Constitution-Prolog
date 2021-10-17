age(Name, Age).
citizen(Name, Years).
qualified(X, houseOfRepresentatives) :- (age(X, Age), Age >= 25), (citizen(X, Years), Years >= 7).
voterQualified(Y, positionOfOffice) :- (age(Y, Age), Age >= 18). %Ammendment 26%
