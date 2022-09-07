%Logic function for playing blackjack
function playerScores = playBlackjack(numPlayers, numDecks)
    %Empty for playerScore
    playerScores = [];
    %Empty for players that won
    playerWins = ["",""];
    %call decks function
    deck = decks(numDecks);
    %call shuffleDeck function
    deck = shuffleDeck(deck);
    %Define that players have not lost yet
    allPlayerLose = false;
    %Deal hands to players
    [hands, deck, playerCardCount] = dealHands(deck, numPlayers);
    %State the dealers up card (The card that everyone can see)
    fprintf("\nDealer up card is %s\n", hands(1,4))
    %Pause to allow players to observer dealer card before resuming
    pause(1)
    %Iterate through each players (As dealer is player 1 in hands array)
    for player = 2:(numPlayers+1)
        %For player eval player's cards and define it to hands column 3
        hands(player, 3) = evalCard(hands,player);
        %Define stand as false
        stand = false;
        %print player's cards and their score
        fprintf("Player %d your cards are a %s and a %s meaning you are at %s\n",(player-1), hands(player, 4), hands(player,5), hands(player,3))
        %Pause for them to think
        pause(3)
        %If players reach 21 from initial deal force them to stand and
        %print 21! and set their score to 21 in playerScores array
        if evalCard(hands, player) == 21
                playerScores(player, 1) = evalCard(hands,player);
                fprintf("21!\n")
                stand = true;
        end
        %If player did not reach 21 prompt them to stand or hit if input is
        % not valid iterate through again and ask again
        while stand == false
            playerAction = input("Hit or Stand?\n", 's');
            %Set lower case to prevent case issues
            playerAction = lower(playerAction);
            switch(playerAction)
                case 'hit'
                    %hit player use hitPlayer function
                    [hands, deck, playerCardCount, card] = hitPlayer(deck, hands, player,playerCardCount);
                    displayDealtCard(card)
                    %Define player scores after being hit
                    playerScores(player, 1) = evalCard(hands,player);
                    %Print you hit
                    fprintf("Player %d hit!\n",player-1)
                    pause(1)
                    %Print your card
                    fprintf("Player %d you got a %s\n",(player-1), hands(player, playerCardCount+3))
                    pause(2)
                    %Print your score
                    fprintf("Meaning your score is %d\n", evalCard(hands, player))
                case 'stand'
                    %if stand = true define so and set player score
                    playerScores(player, 1) = evalCard(hands,player);
                    stand = true;
                otherwise
                    %if input is error print it so.
                    fprintf('Not a valid choice check your spelling ')
            end
            %If players reach 21 from initial deal force them to stand and
            %print 21! and set their score to 21 in playerScores array
            if evalCard(hands, player) == 21
                playerScores(player, 1) = evalCard(hands,player);
                fprintf("21!\n")
                stand = true;
            end
            %Check if player went over 21 if true print they lost as going
            %over 21 results in an instant loss set stand to true
            if evalCard(hands, player) > 21
                fprintf("That is over 21, Player %d\nYou lose!\n", player-1)
                playerScores(player, 1) = evalCard(hands,player);
                %Define player lost in playerWins array
                playerWins(player-1) = "Lost";
                stand = true;
            end
        end
        playerCardCount = 2;
        %Define card count for next player {Defining at the start of the
        %function created errors}
    end
    %Check if all the players have lost to the dealer using playersVDealer
    %function
    allPlayerLose = playersVDealer(playerScores,numPlayers, playerWins);
    %Print the dealers hidden card
    fprintf("Dealer down card was %s\n", hands(1,4))
    pause(1)
    %Pause for players to read
    fprintf("Dealer score is %d\n", evalCard(hands,1))
    %Print dealers score
    pause(3)
    %Pause
    playerScores(1,1) = evalCard(hands,1);
    %Evaluate dealer's hand
    %if all the players have lost
    if allPlayerLose == true
        fprintf("All players lost!\n")
        pause(3)
    end
    %while the dealer has not gone over 21 and all players have not lost
    while allPlayerLose == false && evalCard(hands, 1) < 21
        for i = 2:(numPlayers+1)
            %Iterate through each player checking if the dealer beat them
            if playerScores(i,1) < evalCard(hands,1)
                fprintf("Player %d you lose dealer score is: %d\n", i-1, evalCard(hands,1))
                playerWins(i-1) = "Lost";
                pause(3)
            end
        end
        %Check if players have lost
        allPlayerLose = playersVDealer(playerScores,numPlayers, playerWins);
        %if still not lost hit the dealer
        if allPlayerLose == false
            %Define card count again
            [hands, deck, playerCardCount, card]= hitPlayer(deck,hands,1,playerCardCount);
            displayDealtCard(card)
            %Print dealer score
            fprintf("Dealer hits\nScore is %d!\n", evalCard(hands,1))
            playerScores(1,1) = evalCard(hands,1);
            pause(3)
        end
        %If dealer hits 21 print
        if evalCard(hands, 1) == 21
            fprintf("Dealer hit 21! Everyone loses!\n")
            for i = 2:(numPlayers+1)
                if playerScores(i,1) == 21
                    %if another player hit 21 define he drew
                    fprintf("Except for Player %d, whom tied",i-1)
                end
            end
            break
        end
    end
    %If the dealer goes over and everyone has not lost
    if allPlayerLose == false && evalCard(hands, 1) > 21
        for i = 1:(numPlayers)
            %if player equaled dealer player drew
            if evalCard(hands,1) == evalCard(hands,i+1) && evalCard(hands, i+1) < 22
                fprintf("Player %d drew with the dealer \n", i)
            end
            %Print players that won
            if playerWins(i) ~= "Lost" && evalCard(hands,1) ~= evalCard(hands,i+1)
                fprintf("Player %d won as the dealer went over!\n", i)
            end
        end
    end
    
    
    
    
        