%Function to generate a given deck
function deck = decks(x)
    deck = [];
    for i = 1:x
        %Iterate through number of decks each time adding a suit of each
        %kind of card
        %Use suit function to create each suit
        %Generate deck x amount of times
        %Generate for each suit by calling suit function
        hearts = suit("Hearts");
        diamonds = suit("Diamonds");
        clubs = suit("Clubs");
        spades = suit("Spades");
        %Add to deck
        deck = [deck, hearts, diamonds, clubs, spades];
    end
end