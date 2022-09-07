%Function to shuffle the deck
function shuffledDeck = shuffleDeck(x)
%Based on desk size create a randperm of numbers and using those numbers
%give the deck that position for each element.
    [~,decksize] = size(x);
    randomperm = randperm(decksize);
    for i = 1:decksize
      shuffledDeck(i) = x(randomperm(i));
    end
end