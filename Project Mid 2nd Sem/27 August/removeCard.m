function deck = removeCard(deck)
    %remove card from deck after being dealt
    [~,numColsDeck] =  size(deck);
    %for length of deck -1 use one in front, add empty to last position
    for i = 1:(numColsDeck - 1)
        deck(i) = deck(i+1);
    end
    deck(numColsDeck) = "";
end