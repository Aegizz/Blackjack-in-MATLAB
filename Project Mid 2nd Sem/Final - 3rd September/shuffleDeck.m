%function to shuffle the deck
function shuffledDeck = shuffleDeck(deck)
    [~, numColsDeck] = size(deck);
    %create a random permuation of all the numbers the size of the deck
    randomperm = randperm(numColsDeck);
    for i = 1:numColsDeck
      %Set each card in a position to the random number within the deck
      shuffledDeck(i) = deck(randomperm(i));
    end
end