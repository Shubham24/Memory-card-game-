% clear workspace and command window
clear; clc;
%%
%Instructions
fprintf('\nWelcome to Memory!!')
fprintf('\n')
fprintf('\nHere are some instructions:')
fprintf('\n1) Follow the prompts on screen')
fprintf('\n2) The goal is to match all the cards in pairs')
fprintf('\n')
fprintf('\nEnjoy!!')
fprintf('\n')
%%
%Loads the BlueDeck and RedDeck into the Workspace
load CardDeck;
    
%%
% ask for GridSize input and store value in variable GridSize
GridSize=input('\nInsert 2, 4, or 6 for the card grid size: ');

% if the input in invalid: as in GridSize not equal 2,4,6 and also not
% not being one number
while ((length(GridSize) ~= 1) || (GridSize ~= 2 && GridSize ~= 4 && GridSize ~= 6))
    fprintf('\nERROR: Enter a valid Grid Size!'); % print error
    GridSize=input('\nInsert 2, 4, or 6 for the card grid size: '); % reprompt for Grid Size
end

ShuffledDeck=randperm(52); % generate a vector with random permutation from 1 to 52

% creates hands choosing from shuffled deck
hand=ShuffledDeck(1:GridSize);
hand2=ShuffledDeck(GridSize+1:2*GridSize);
hand3=ShuffledDeck(2*GridSize+1:3*GridSize);



% if GridSize is equal to 2
if GridSize == 2
    % create a vector bigHand that has hand along with its coreesponding pair
    bigHand = [hand hand];
    % create a vector shuffledIndex from 1 to the length of bigHand
    shuffledIndex = randperm(length(bigHand));
    
    for i = 1:length(bigHand)
        % create a vector shuffledHand that stores the value of bigHand at
        % index of whatever the value of shuffledIndex at index i is
        % basically shuffles the order of the card values
        shuffledHand(i) = bigHand(shuffledIndex(i));
    end
    
    % sorts shuffledHand into a proper 2 x 2 matrix
    shuffledHand = [shuffledHand(1:2);shuffledHand(3:4)];
end

% if GridSize is equal to 4
if GridSize == 4
    % create a vector bigHand that has hand and hand2 along with its
    % corresponding pairs
    bigHand = [hand hand hand2 hand2];
    % create a vector shuffledIndex from 1 to the length of bigHand
    shuffledIndex = randperm(length(bigHand));
    for i = 1:length(bigHand)
        % create a vector shuffledHand that stores the value of bigHand at
        % index of whatever the value of shuffledIndex at index i is
        % basically shuffles the order of the card values
        shuffledHand(i) = bigHand(shuffledIndex(i));
    end
    
    % sorts shuffledHand into a proper 4 x 4 matrix
    shuffledHand = [shuffledHand(1:4);shuffledHand(5:8); shuffledHand(9:12); shuffledHand(13:16)];
end

% if GridSize is equal to 4
if GridSize == 6
    % create a vector bigHand that has hand, hand2, and hand3 along with its
    % corresponding pairs
    bigHand = [hand hand hand2 hand2 hand3 hand3];
    % create a vector shuffledIndex from 1 to the length of bigHand
    shuffledIndex = randperm(length(bigHand));
    for i = 1:length(bigHand)
        % create a vector shuffledHand that stores the value of bigHand at
        % index of whatever the value of shuffledIndex at index i is
        % basically shuffles the order of the card values
        shuffledHand(i) = bigHand(shuffledIndex(i));
    end
    
    % sorts shuffledHand into a proper 4 x 4 matrix
    shuffledHand = [shuffledHand(1:6);shuffledHand(7:12); shuffledHand(13:18); shuffledHand(19:24); shuffledHand(25:30); shuffledHand(31:36)];
end
    
    
   
%%
% Creates a matrix of GridSize x GridSize, in which all of the elements are
% 55. Which is the value of a faced down card in BlueDeck
for i = 1:GridSize
    for j = 1:GridSize
        board(i,j) = 55;
    end
end

%%
% initialize variables
win = 0; % boolean win to false
match = 0; % int match to 0
tries = 0; % int tries to 0

% calls showCard() funtion to create a figure and show all cards
showCard(board);

% while win is false
while win == 0
    coords = input('\nInput the first card you want to flip following the format (WITH Brackets) [row #,column #]: '); % ask player to input the coordinates for the first card and store the value in coords
    % while the length of coords is not equal to 2 OR coords(1) has a value
    % that is less than 1 or greater than the GridSize
    % OR coords(2) has a value that is less than 1 or is greater than
    % GridSize
    while ((length(coords) ~= 2) ||(coords(1) < 1 || coords(1) > GridSize ) || (coords(2) < 1 || coords(2) > GridSize))
        fprintf('\n Error - Invalid Input '); % print error
        coords = input('\nInput the first card you the card you want to flip (WITH Brackets) [row #,column #]: '); %reprompt player to enter coordinates
    end
    x = coords(1); % set variable x to coords(1)
    y = coords(2); % set variable y to coords(2)
    % if board at row x, and column y is equal to 55 (faced down)
    if board(x,y) == 55    
        board(x,y) = shuffledHand(x,y); % set board's value at row x and column y to the value of shuffledHand's value at the same position
        showCard(board); % call showCard() function to show the updated figure
        coords2 = input('\nInput the second card you want to flip following the format (WITH Brackets) [row #, column #]: '); % ask player to input the coordinates for the second card and store the value in coords2
        % while the length of coords2 is not equal to 2 OR coords2(1) has a value
        % that is less than 1 or greater than the GridSize
        % OR coords2(2) has a value that is less than 1 or is greater than
        % GridSize
        while ((length(coords2) ~= 2) || (coords2(1) < 1 || coords2(1) > GridSize ) || (coords2(2) < 1 || coords2(2) > GridSize))
            fprintf('\n Error - Invalid Input '); % print error
            coords2 = input('\nInput the second card you want to flip following the format (WITH Brackets) [row #, column #]: '); %reprompt player to enter coordinates
        end
        x2 = coords2(1); % set variable x2 to coords2(1)
        y2 = coords2(2); % set variable y2 to coords2(2)
        % while x is equal to x2 AND y is equal to y2 OR board(x2,y2) is
        % not equal to 55
        while (x == x2 && y == y2) || board(x2,y2) ~= 55
            fprintf('\nERROR: Card is Already Flipped!'); % print error
            coords2 = input('\nInput the second card you want to flip following the format [row #,column #]: '); %reprompt player to enter coordinates
            % check for the validity of this input
            while ((length(coords2) ~= 2) || (coords2(1) < 1 || coords2(1) > GridSize ) || (coords2(2) < 1 || coords2(2) > GridSize))
            fprintf('\n Error - Invalid Input ');
            coords2 = input('\nInput the second card you want to flip following the format (WITH Brackets) [row #, column #]: ');
            end
            x2 = coords2(1); % set variable x2 to coords2(1)
            y2 = coords2(2); % set variable y2 to coords2(2)
        end
        % if the value of board at row x2 and column y2 is equal to 55
        if board(x2,y2) == 55
            board(x2,y2) = shuffledHand(x2,y2); % set the value of board at row x2 and column y2 equal to the value of shuffledHand at the same position
            showCard(board); % call showCard() function
        end 
    % if the value of board at row x and column y is equal to the value of
    % board at row x2 and column y2 and that value is not equal to 55
    if board(x,y) == board(x2,y2) && board(x,y) ~= 55
        fprintf('\nMatch!'); % print match statement
        match = match + 1; % add one to match variable
        tries = tries + 1; % add one to tries variable
    % if the two values are not equal
    else
        fprintf('\nNot a Match'); % print not a match statement
        pause(2); % pause
        board(x,y) = 55; % make the value of board(x,y) to 55 (flip the card over)
        board(x2,y2) = 55; % make the value of board(x2,y2) to 55 (flip the card over)
        showCard(board); % call showCard() function
        tries = tries + 1; % add one to tries variable
    end
    
    % if the number of matches equals the number of pairs (GridSize ^ 2)/2)
    if match == ((GridSize * GridSize)/2)
        win = 1; % set win to true
    end
    % if board(x,y) is not equal to 55 when coordinates are asked to flip
    % the first card
    else
        fprintf('\nERROR: Card is Already Flipped!'); % print error
    end
    
end

fprintf('\nYou Won!! It only took you %d tries', tries); % print win statement and the number of tries it took

    