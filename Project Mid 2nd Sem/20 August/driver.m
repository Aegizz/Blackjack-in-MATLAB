%driver for a one deck game, check all cards are there and are pseudorandom
numDecks = 1;
deck = decks(numDecks)
deck = shuffleDeck(deck)
numDecks = 2;
deck = decks(numDecks)
deck = shuffleDeck(deck)
numDecks = 0;
deck = decks(numDecks)
%Creates error since 0 decks exits which makes sense practically
deck = shuffleDeck(deck)