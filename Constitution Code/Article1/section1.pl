/* all legislative powers granted shall be vested in congress */

legislativePowers(congress).
legislativePowers(X) :- congress(X).

/* congress contains senate and house of representatives */
congress(X) :- member(X,[senate,houseOfRepresentatives]).

