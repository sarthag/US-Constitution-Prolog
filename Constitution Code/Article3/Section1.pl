judicialPowers :- court.
court :- congressOrdained(Court).
congressOrdained(supremeCourt).
judge(Court).
holdOffice(judge) :- behaviour(judge,good), tenure(judge).
compensation(judge) :- holdOffice(judge).
