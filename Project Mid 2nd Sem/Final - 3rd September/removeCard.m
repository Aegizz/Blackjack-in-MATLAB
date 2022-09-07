%Function to remove cards
function deck = removeCard(deck)
    %size of the deck of cards
    [~,numColsDeck] =  size(deck);
    %iterate through the size of the deck but 1
    for i = 1:(numColsDeck - 1)
        %move each card in the deck down one position
        deck(i) = deck(i+1);
    end
    %define the last value as an empty
    deck(numColsDeck) = "";
end