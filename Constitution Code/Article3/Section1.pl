judicialPowers :- court.
court :- congressOrdained(Court).
congressOrdained(supremeCourt).
holdOffice(judge(court)) :- behaviour((judge(court)),good), tenure(judge(court)).
compensation(judge(court)) :- holdOffice(judge(court)).
