function [ probs ] = pokerProbs( decks, iterMax )
    fprintf('Calculating poker hand probabilities\n');
    format long;
    suit = ones(13,1);
    t = [2:14]';
    deck = [[suit; suit+1; suit+2; suit+3] [t; t; t; t]];
    deck = [deck; deck];
    freq = zeros(11, 1);
    
    for i = 1:iterMax
        idx = randperm(size(deck,1),5);
        h = deck(idx,:);
        n = getHand(h);
        freq(n) = freq(n) + 1;
    end
    
    freq = freq ./ sum(freq);
    c = categorical({'1. Nothing','2a. Pair','2b. 2 Pairs','3. Drill','4. Straight','5. Flush','6. Full House','7. Poker','8a. Straight Flush','8b. Royal Flush','9. Royal Poker'})
    bar(c, freq);
    title('Poker hand probabilities');
    probs = freq;
end

function [ hand ] = getHand( h )
    
    suits = h(:,1);
    nums = h(:,2);
    T = ones(5,1);
    if isFiveOfAKind(h)
        hand = 11; %Royal poker
    elseif isFlush(h)
        if isStraight(h)
            if nums(1) == 10
                hand = 10; %Royal flush
            else
                hand = 9; %Straight flush
            end
        else
            hand = 6; %Flush
        end
    else
        if isFourOfAKind(h)
            hand = 8; %Poker
        elseif isStraight(h)
            hand = 5; %Straight
        else
            if isPair(h)
                hand = 2; %Pair
            elseif isThreeOfAKind(h)
                hand = 4; %Three of a kind;
            elseif isTwoPairs(h)
                hand = 3; %Two pairs;
            elseif isFull(h)
                hand = 7; %Full house
            else
                hand = 1; %Nothing;
            end
        end
    end
    
end
    
function [ straight ] = isStraight( h )
    h = sortrows(h, 2);
    nums = h(:,2);
    nums = nums - min(nums);
    straight = nums == [0:4]';
end

function [ five ] = isFiveOfAKind( h )
    nums = h(:,2);
    five = length(unique(nums)) == 1;
end

function [ four ] = isFourOfAKind( h )
    nums = h(:,2);
    his = unique(histcounts(nums, [2:14]));
    four = length(unique(nums)) == 2 & his(end) == 4;
end

function [ full ] = isFull( h )
    nums = h(:,2);
    his = unique(histcounts(nums, [2:14]));
    full = length(unique(nums)) == 2 & his(end) == 3;   
end

function [ three ] = isThreeOfAKind( h )
    nums = h(:,2);
    his = unique(histcounts(nums, [2:14]));
    three = length(unique(nums)) == 3 & his(end) == 3;
end

function [ twos ] = isTwoPairs( h )
    nums = h(:,2);
    his = unique(histcounts(nums, [2:14]));
    twos = length(unique(nums)) == 3 & his(end) == 2;
end

function [ two ] = isPair( h )
    nums = h(:,2);
    two = length(unique(nums)) == 4;
end

function [ flush ] = isFlush( h )
    suits = h(:,1);
    one = all(suits == 1);
    two = all(suits == 2);
    three = all(suits == 3);
    four = all(suits == 4);
    flush = one | two | three | four;
end