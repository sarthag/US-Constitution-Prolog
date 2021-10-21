judicialPowers :- congressOrdained(Court).
congressOrdained(supremeCourt).
holdOffice(Judge) :- behaviour(Judge,good), tenure(Judge).
compensation(Judge) :- holdOffice(Judge).