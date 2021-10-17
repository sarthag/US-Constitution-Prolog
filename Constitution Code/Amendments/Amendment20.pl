/* SECTION 1 */

end(term(president), date(1200, 20, january)).
end(term(vicePresident), date(1200, 20, january)).
end(term(senator), date(1200, 3, january)).
end(term(representative), date(1200, 3, january)).

begins(term(PresidentB)) :-
    ended(term(PresidentA)).
begins(term(VicePresidentB)) :-
    ended(term(VicePresidentA)).
begins(term(SenatorB)) :-
    ended(term(SenatorA)).
begins(term(RepresentativeB)) :-
    ended(term(RepresentativeA)).

/* SECTION 2 */

assemble(congress, atleastOnce(year), date(1200, 3, january)) :-
    not(appoint(differentDay)).

/* SECTION 3 */

becomePresident(vicePresident) :-
    dead(presidentElect, beginningOfTerm).

actingPresident(vicePresident, until(chosen(newPresident))) :-
    not(chosen(president, before(beginningOfTerm)));
    failed(qualify(presidentElect)).

may(congress, byLaw(provide(case1))).

case1 :- 
    not(qualify(presidentElect)),
    not(qualify(vicePresidentElect)).

/* SECTION 4 */

may(congress, byLaw(provide(case2))).

case2 :- 
    death(candidate(president, chosenBy(houseOfRepresentatives)));
    death(candidate(vicePresident, chosenBy(senate))).


/* SECTION 5 */

takeEffect(section1, date(15, october), after(ratification(thisArticle))).
takeEffect(section2, date(15, october), after(ratification(thisArticle))).

/* SECTION 6 */

operative(thisArticle) :-
    ratified(amendment(constitution), threeFourths(states), withinYears(7)).
