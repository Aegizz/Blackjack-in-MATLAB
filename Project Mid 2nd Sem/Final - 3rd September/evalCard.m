%Evaluate the players current card number
function [cardEval, aceCount] = evalCard(Hands, player)
    %Convert players number of cards to a number
    playerCardCount = str2double(Hands(player,2));
    cardEval = 0;
    aceCount = 0;
    for i = 1:playerCardCount
        %Iterate through cards in the dealt hand for a given player
        num = convertStringsToChars(Hands(player,i+3));
        %Convert the string to a character array from the hands array
        switch(num(1))
            %If the first value in the character array = q k or j let it
            %equal 10
            case {'Q', 'K', 'J'}
            numAsString = 10;
            case 'A'
            %For case of an Ace give it a value of 11 and add 1 to the ace
            %counter
            numAsString = 11;
            aceCount = aceCount +1;
            otherwise
                %else take the number within the character array at the
                %front and convert to double and add it to the card eval
                if num(1:2) == '10'
                    numAsString = 10;
                else
                    numAsString = str2double(num(1));
                end
        end
        cardEval = cardEval + numAsString;
        if aceCount > 0 && cardEval > 21
            %If there is an ace and the score must be reduced because it went
            %over 21, minus 10 as the ace will then have a score of one. cardEval may still be over 21 but irrelevant 
            cardEval = cardEval - 10;
            aceCount = 0;
        end
    end
end