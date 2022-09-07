%Function to generate all the cards within a given suite.
function deck = suit(x)
    deck = ["Ace",2,3,4,5,6,7,8,9,10,"Jack","Queen","King"];
    %each element of suit
    %add each element to the the kind of suit being added
    for i = 1:length(deck)
        deck(i) = strcat(string(deck(i))," of ",string(x));
    end
end

