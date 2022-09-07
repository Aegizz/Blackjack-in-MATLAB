%Driver script
%Ask for player count and deck number
numPlayers = input("How many players are playing? ");
numDecks = input("How many decks would you like to play with? ");
%Instance play
play = true;
%play blackjack
while play == true
    playBlackjack(numPlayers,numDecks);
    %When done ask if they would like to play again
    playAgain= input("Play again?\n",'s');
    playAgain = lower(playAgain);
    %place in lower case to avoid case issues
    switch(playAgain)
        case "yes"
            play = true;
            %start function again as playBlackjack = true
        case "no"
            play = false;
            %if so end the function as play = false
    end
end