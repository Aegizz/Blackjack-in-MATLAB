%Define a suit for the deck of cards
function deck = suit(suitName)
    deck = ["Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King"];
    % define each value
    for i = 1:length(deck)
        %for the length of the suite add the name of the suite to the end
        deck(i) = strcat(string(deck(i))," of ",string(suitName));
    end
end

