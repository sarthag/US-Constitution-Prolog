%%from previous sections

concurrence(house,Fraction).
%%Defining the 2 houses of us govt.
senate.
houseOfRepresentatives.
house :- senate.
house :- houseOfRepresentatives.

%%powers of the house

disorderlyBehaviour(X).
power(house,judge(elections(members))).
power(house,returnsAndQualifications(members)).
power(house,compel(attendance(absent(members)))).

power(house,determine(rulesOfProceedings)).
punish(member).
punish(member,Fraction) :- disorderlyBehaviour(member),(concurrence(house,Fraction ), Fraction > 2/3).
power(house,punish(member)):- disorderlyBehaviour(member).

/*Journal of proceedings*/

keep(house,journalOfProceedings).
/*what the journal of proceedings will contain*/
includeYeasAndNays(members(house),Fraction) :- (concurrence(house, Fraction),Fraction > (1/5)).

/*including  Yeas and Nays in the content of journal of proceedings*/
content(journalOfProceedings,Fraction) :- includeYeasAndNays(members(house),Fraction) .

/*rules related to congress*/
adjourn(house,TimeOfAdjourning) :- (TimeOfAdjourning =< 3).  






