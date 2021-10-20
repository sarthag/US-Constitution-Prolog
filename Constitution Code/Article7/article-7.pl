establishmentOfConstitution(nineStates) :-
    ratification(nineStates).
dateOfRatification(17,09,1787).

witness(stateOfUs(newHampshire), johnLangdon).
witness(stateOfUs(newHampshire), nicholasGilman).
witness(stateOfUs(massachusetts), nathanielGorham).
witness(stateOfUs(connecticut), wmSamlJohnson).
witness(stateOfUs(connecticut), rogerSherman).
witness(stateOfUs(connecticut), rogerSherman).
witness(stateOfUs(connecticut), rogerSherman).
witness(stateOfUs(newYork), alexanderHamilton).
witness(stateOfUs(newJersey), wilLivingston).
witness(stateOfUs(newJersey), davidBrearley).
witness(stateOfUs(newJersey), wmPaterson).
witness(stateOfUs(newJersey), jonaDayton).
witness(stateOfUs(pennsylvania), bFranklin).
witness(stateOfUs(pennsylvania), thomasMifflin).
witness(stateOfUs(pennsylvania), robtMorris).
witness(stateOfUs(pennsylvania), geoClymer).
witness(stateOfUs(pennsylvania), thosFitzSimons).
witness(stateOfUs(pennsylvania), jaredIngersoll).
witness(stateOfUs(pennsylvania), jamesWilson).
witness(stateOfUs(pennsylvania), gouvMorris).
witness(stateOfUs(delaware), geoRead).
witness(stateOfUs(delaware), gunningBedfordJun).
witness(stateOfUs(delaware), johnDickinson).
witness(stateOfUs(delaware), richardBassett).
witness(stateOfUs(delaware), jacoBroom).
witness(stateOfUs(maryland), jamesMcHenry).
witness(stateOfUs(maryland), danOfStThosJenifer).
witness(stateOfUs(maryland), danlCarroll).
witness(stateOfUs(virginia), johnBlair).
witness(stateOfUs(virginia), jamesMadisonJr).
witness(stateOfUs(northCarolina), wmBlount).
witness(stateOfUs(northCarolina), richdDobbsSpaight).
witness(stateOfUs(northCarolina), huWilliamson).
witness(stateOfUs(southCarolina), jRutledge).
witness(stateOfUs(southCarolina), charlesCotesworthPinckney).
witness(stateOfUs(southCarolina), charlesPinckney).
witness(stateOfUs(southCarolina), pierceButler).
witness(stateOfUs(georgia), williamFew).
witness(stateOfUs(georgia), abrBaldwin).
witness(stateOfUs(washington), secretaryWilliamJackson).

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
electorsAppointed(State1,Day1) :- congressElects(Day1,Day2,Time,Place).
electorsVote(president, Day2) :- congressElects(Day1,Day2,Time,Place).
convene(senators,representatives,Time,Place) :- congressElects(Day1,Day2,Time,Place).
