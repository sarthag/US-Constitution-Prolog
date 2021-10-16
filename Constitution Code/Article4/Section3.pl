faith(StateA) :- act(StateB); record(StateB); judicialProceeding(StateB).
new(state) :- admitted(congress), (not(part(existingState)); consent(legislature(existingState), consent(congress))).
power(congress, rulesRegardingTerritory).

