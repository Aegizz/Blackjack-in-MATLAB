%Check if players have lost
function playersLost = playersVDealer(playerScore, numPlayers, playerWins)
    %instance lost and players lost
    lost = 0;
    playersLost = false;
    %check player wins if all players have lost by going through the array
    for i = 1:(numPlayers)
        if playerWins(i) == "Lost"
            lost= lost+1;
        end
    end
    %if it equals to every player every player lost.
    if lost == numPlayers
        playersLost = true;
    end
end




        
