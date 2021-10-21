tenderList([gold,silver]).
paymentOfDebts(Mode) :- not(member(Mode,tenderList)).
billsNotAllowed([billOfAttainder,exPostFactoLaw,impairingObligationOfContracts,grant(titleOfNobility)]).

/*passBill is for passing disallowed bills*/
cantPassBill(Bill) :- member(Bill,billsNotAllowed)
notAllowedForStates([entering([Treaty,Alliance,Confederation]),
grant(lettersOfMarqueeAndReprisal),
coinMoney,
emit(billsOfCredit),
tender(paymentOfDebts(Mode)),
cantPassBill(Bill)]).

/* Functor tells whether a certain action is allowed or not*/
dissallowed(Action) :- member(Action,memberOfStates).

/* List of items that require consent of congress*/
needConsentOfCongress ([
    lay(impostsOrDuties(importsOrExports)),
    lay(dutyOfTonnage),
    keep(troops),
    keep(shipsOfWarduringPeace),
    enter(agreementOrCompact([anotherState,foriegnPower])),
    engage(war(Reason)).
]).
/* noConsentNeeded is a list of conditions where there is no necessity for Congress consent for war*/
noConsentNeeded([invaded,imminentDanger]).
/* need consent unless invasion or imminent danger*/
engage(war(Reason)) :- not(member(Reason,noConsentNeeded)).

/* Functor tells whether a certain action needs Congress consent*/
needsCongressConsent(Action) :- member(Action,needConsentOfCongress).