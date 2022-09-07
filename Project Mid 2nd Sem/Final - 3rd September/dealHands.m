function [hands, deck, playerCardCount] = dealHands(deck, numPlayers)
    %Create Matrix for Hand
    hands = ["", missing];
    for i = 1:(numPlayers+1)
        %Iterate from Dealer Pos to Player and add cards to the end
        hands(i,1) = strcat("Player ",  string(i-1));
        %Leave 2nd column empty
        hands(i,2) = missing;
    end
    %Define top spot to be dealer
    hands(1,1) = 'Dealer';
    for player = 1:(numPlayers+1)
        %iterate through players and deal cards using hitPlayer function
        for currentCardCount = 0:1
        [hands, deck, playerCardCount] = hitPlayer(deck,hands,player, currentCardCount);
        %Place card count function in correct position
        hands(player,2) = playerCardCount;
        end
    end
end