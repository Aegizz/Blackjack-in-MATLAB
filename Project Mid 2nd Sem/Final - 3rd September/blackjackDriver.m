%Driver for script

%Ask for num players
numPlayers = input("How many players are playing? ");
%Ask for number of decks
numDecks = input("How many decks would you like to play with? ");
%Define play
play = true;
while play == true
%function to run the blackjack function
    playBlackjack(numPlayers,numDecks);
    %Ask to play again
    playAgain= input("Play again?\n",'s');
    %place it in lower case to prevent confusion for the switch case
    playAgain = lower(playAgain);
    switch(playAgain)
        case "yes"
            play = true;
        case "no"
            play = false;
        otherwise
            playAgain= input("Play again?\n (Input Failed)",'s');
    %enable players to choose yes or no to play again could be done using
    %conditional statement
    end
end
%Additional Notes: This script accurately represents how a game of
%blackjack plays allowing the statistical mathematics behind the game to be
%applied while enabling players to accurately count cards. This was
%important in the creation of the code as representations of classic card
%games like Uno, Poker, Solitare and many others often skip what enables a
%card game to be a game of skill rather than luck. 