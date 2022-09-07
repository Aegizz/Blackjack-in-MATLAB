%driver for a one deck game, check all cards are there and are pseudorandom
numDecks = 1;
numPlayers = 1;
deck = decks(numDecks);
deck = shuffleDeck(deck)
%test for 2 player with 2 decks
%Deal hands in the same proccess that a dealer would deal hands
hands = dealHands(deck, numPlayers)
numDecks = 2;
numPlayers = 2;
deck = decks(numDecks);
deck = shuffleDeck(deck)
%Deal hands in the same proccess that a dealer would deal hands
hands = dealHands(deck, numPlayers)
%Different test case
numDecks = 3;
numPlayers = 5;
deck = decks(numDecks);
deck = shuffleDeck(deck)
%Deal hands in the same proccess that a dealer would deal hands
hands = dealHands(deck, numPlayers)