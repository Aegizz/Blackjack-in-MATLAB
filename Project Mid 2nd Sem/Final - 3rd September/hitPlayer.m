%Function to deal a card to a player denoted in blackjack as "hitting"
function [hands, deck, playerCardCount, card] = hitPlayer(deck, hands, player,playerCardCount)
    %Take the first item in the deck and add it to the player's hand
    hands(player, playerCardCount+4) = deck(1);
    card = deck(1);
    deck  = removeCard(deck); %Remove card from the deck
    %Increase the player's card count
    playerCardCount = playerCardCount+1;
    %Add it to the hand array
    hands(player,2) = playerCardCount;
    %Remove the first element in the deck after adding it
end