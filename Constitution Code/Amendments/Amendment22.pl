/* Section 1 */
not(elected(president, X)) :- heldOfficeTwice(X, president).
not(elected(president, X)) :-
  heldOfficeOnce(X, president),
  actedAs(president, X, forYears(2)).
not(apply(thisArticle, X)) :- holdingOffice(X, while(not(operative(thisArticle)))).

/* Section 2 */

operative(thisArticle) :-
  ratified(amendment(constitution), threeFourth(states), withinYears(7)).
