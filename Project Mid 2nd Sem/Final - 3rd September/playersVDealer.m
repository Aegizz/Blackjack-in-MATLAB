function playersLost = playersVDealer(playerScore, numPlayers, playerWins)
    lost = 0;
    playersLost = false;
    for i = 1:(numPlayers)
        if playerWins(i) == "Lost"
            %for players that lost add one to lost tally
            lost= lost+1;
        end
    end
    if lost == numPlayers
        %if lost tally = the number of players all players lost
        playersLost = true;
    end
end




        
