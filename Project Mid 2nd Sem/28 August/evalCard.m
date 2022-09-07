function [cardEval, aceCount] = evalCard(hands, player)
    %find the player card count from hands
    playerCardCount = str2double(hands(player,2));
    %instance card eval and ace count as 0
    cardEval = 0;
    aceCount = 0;
    for i = 1:playerCardCount
        %For the each of the player's card count
        %Convert card to Character array
        num = convertStringsToChars(hands(player,i+3));
        %Find the first value of it
        switch(num(1))
            %if queen king or jack = 10
            case {'Q', 'K', 'J'}
            numAsString = 10;
            case 'A'
            %if ace 11 and add ace count
            numAsString = 11;
            aceCount = aceCount +1;
            otherwise
                %if first two numbers = 10; then it is 10
                if num(1:2) == '10'
                    numAsString = 10;
                else
                    %otherwise convert first number to numasstring
                    numAsString = str2double(num(1));
                end
        end
        %Add the card eval together with num as string
        cardEval = cardEval + numAsString;
        %if the card eval as gone over 21 and the ace count is greater than
        %0 use the ace as a 1
        if aceCount > 0 && cardEval > 21
            cardEval = cardEval - 10;
        end
    end
end