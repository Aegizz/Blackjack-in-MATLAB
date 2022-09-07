function [hands, deck, playerCardCount] = hitPlayer(deck, hands, player,playerCardCount)  
    hands(player, playerCardCount+4) = deck(1);
    deck  = removeCard(deck);
    playerCardCount = playerCardCount+1;
    hands(player,2) = playerCardCount;
    %Remove the first element in the deck after adding it
    %Leave space on the 3rd column for eval card to check player score and 
    %2nd column for amount of cards hit to determine column length as
    %players will hit different amount of times
end