establishmentOfConstitution(nineStates) :-
    ratification(nineStates).

dateOfRatification(17, 09, 1787).

witness(stateOfUS(newHampshire), johnLangdon).
witness(stateOfUS(newHampshire), nicholasGilman).
witness(stateOfUS(massachusetts), nathanielGorham).
witness(stateOfUS(connecticut), wmSamlJohnson).
witness(stateOfUS(connecticut), rogerSherman).
witness(stateOfUS(connecticut), rogerSherman).
witness(stateOfUS(connecticut), rogerSherman).
witness(stateOfUS(newYork), alexanderHamilton).
witness(stateOfUS(newJersey), wilLivingston).
witness(stateOfUS(newJersey), davidBrearley).
witness(stateOfUS(newJersey), wmPaterson).
witness(stateOfUS(newJersey), jonaDayton).
witness(stateOfUS(pennsylvania), bFranklin).
witness(stateOfUS(pennsylvania), thomasMifflin).
witness(stateOfUS(pennsylvania), robtMorris).
witness(stateOfUS(pennsylvania), geoClymer).
witness(stateOfUS(pennsylvania), thosFitzSimons).
witness(stateOfUS(pennsylvania), jaredIngersoll).
witness(stateOfUS(pennsylvania), jamesWilson).
witness(stateOfUS(pennsylvania), gouvMorris).
witness(stateOfUS(delaware), geoRead).
witness(stateOfUS(delaware), gunningBedfordJun).
witness(stateOfUS(delaware), johnDickinson).
witness(stateOfUS(delaware), richardBassett).
witness(stateOfUS(delaware), jacoBroom).
witness(stateOfUS(maryland), jamesMcHenry).
witness(stateOfUS(maryland), danOfStThosJenifer).
witness(stateOfUS(maryland), danlCarroll).
witness(stateOfUS(virginia), johnBlair).
witness(stateOfUS(virginia), jamesMadisonJr).
witness(stateOfUS(northCarolina), wmBlount).
witness(stateOfUS(northCarolina), richdDobbsSpaight).
witness(stateOfUS(northCarolina), huWilliamson).
witness(stateOfUS(southCarolina), jRutledge).
witness(stateOfUS(southCarolina), charlesCotesworthPinckney).
witness(stateOfUS(southCarolina), charlesPinckney).
witness(stateOfUS(southCarolina), pierceButler).
witness(stateOfUS(georgia), williamFew).
witness(stateOfUS(georgia), abrBaldwin).
witness(stateOfUS(washington), secretaryWilliamJackson).

congressElects(Day1,Day2,Time,Place) :- ratification(nineStates).

ratification(nineStates) :- 
        conventionOfDelegates(assent, State1) ,
        conventionOfDelegates(assent, State2) ,
        conventionOfDelegates(assent, State3) ,
        conventionOfDelegates(assent, State4) ,
        conventionOfDelegates(assent, State5) ,
        conventionOfDelegates(assent, State6) ,
        conventionOfDelegates(assent, State7) ,
        conventionOfDelegates(assent, State8) ,
        conventionOfDelegates(assent, State9).

electorsAppointed(State1, Day1) :- congressElects(Day1, Day2, Time, Place).
electorsVote(president, Day2) :- congressElects(Day1, Day2, Time, Place).
convene(senators, representatives, Time, Place) :- congressElects(Day1, Day2, Time, Place).
