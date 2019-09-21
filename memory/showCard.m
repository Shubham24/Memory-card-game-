function showCard(board)
%SHOWCARD Summary of this function goes here
% Ueses imshow function to show the cards
%   Detailed explanation goes here
% Takes board as input and shows the images of the cards according the
% value, by using the imshow() function

% loads CardDeck.mat file
load CardDeck;

% makes a cards cell array that contains the BlueDeck card value
for i = 1:length(board)    
    for j = 1:length(board)
        cards(i,j) = {BlueDeck{board(i,j)}};
    end
end

% creates another array called showCards that converts cards into a regular
% array
showCards = cell2mat(cards);

% calls imshow() function to show the cards
imshow(showCards)
end

