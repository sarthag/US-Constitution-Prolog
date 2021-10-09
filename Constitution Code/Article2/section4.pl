impeachment :- conviction(treason).
impeachment :- conviction(bribery).
impeachment :- conviction(highCrimes).
impeachment :- conviction(misdeameanors).

removed(president) :- impeachment.
revoved(vicePresident) :- impeachment.
removed(civilOfficers) :- impeachment.
