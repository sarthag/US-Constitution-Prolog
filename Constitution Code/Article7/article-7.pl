establishmentOfConstitution(nineStates) :-
    ratification(nineStates).
dateOfRatification(17,09,1787).

witness(newHampshire, johnLangdon).
witness(newHampshire, nicholasGilman).
witness(massachusetts, nathanielGorham).
witness(connecticut, wmSamlJohnson).
witness(connecticut, rogerSherman).
witness(newYork, alexanderHamilton).
witness(newJersey, wilLivingston).
witness(newJersey, davidBrearley).
witness(newJersey, wmPaterson).
witness(newJersey, jonaDayton).
witness(pennsylvania, bFranklin).
witness(pennsylvania, thomasMifflin).
witness(pennsylvania, robtMorris).
witness(pennsylvania, geoClymer).
witness(pennsylvania, thosFitzSimons).
witness(pennsylvania, jaredIngersoll).
witness(pennsylvania, jamesWilson).
witness(pennsylvania, gouvMorris).
witness(delaware, geoRead).
witness(delaware, gunningBedfordJun).
witness(delaware, johnDickinson).
witness(delaware, richardBassett).
witness(delaware, jacoBroom).
witness(maryland, jamesMcHenry).
witness(maryland, danOfStThosJenifer).
witness(maryland, danlCarroll).
witness(virginia, johnBlair).
witness(virginia, jamesMadisonJr).
witness(northCarolina, wmBlount).
witness(northCarolina, richdDobbsSpaight).
witness(northCarolina, huWilliamson).
witness(southCarolina, jRutledge).
witness(southCarolina, charlesCotesworthPinckney).
witness(southCarolina, charlesPinckney).
witness(southCarolina, pierceButler).
witness(georgia, williamFew).
witness(georgia, abrBaldwin).
witness(washington, secretaryWilliamJackson).

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
