function [hands, deck, playerCardCount] = dealHands(deck, numPlayers)
    %Create Matrix for Hand
    hands = ["", missing];
    for i = 1:(numPlayers+1)
        %Iterate from Dealer Pos to Player and add cards to the end
        hands(i,1) = strcat("Player ",  string(i-1));
        hands(i,2) = missing;
    end
    %Add dealer name for hand to position
    hands(1,1) = 'Dealer';
    for player = 1:(numPlayers+1)
        %iterate for each player
        for CurrentCardCount = 0:1
        %hit player and add card count
        [hands, deck, playerCardCount] = hitPlayer(deck,hands,player, CurrentCardCount);
        hands(player,2) = playerCardCount;
        end
    end
end