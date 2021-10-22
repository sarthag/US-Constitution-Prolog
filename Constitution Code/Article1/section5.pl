concurrence(house,Fraction).
senate.
houseOfRepresentatives.

disorderlyBehaviour(X).
power(house,judge(elections(members))).
power(house,returnsAndQualifications(members)).
power(house,compel(attendance(absent(members)))).

power(house,determine(rulesOfProceedings)).
punish(member).
punish(member,Fraction) :- disorderlyBehaviour(member),(concurrence(house,Fraction ), Fraction > 2/3).
power(house,punish(member)):- disorderlyBehaviour(member).

keep(house,journalOfProceedings).
includeYeasAndNays(members(house),Fraction) :- (concurrence(house, Fraction),Fraction > (1/5)).

content(journalOfProceedings,Fraction) :- includeYeasAndNays(members(house),Fraction) .

adjourn(house,TimeOfAdjourning) :- (TimeOfAdjourning =< 3).
