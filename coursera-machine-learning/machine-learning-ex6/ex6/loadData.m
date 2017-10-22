function [X, y, Xval, yval, Xtest, ytest] = loadData(vocab_length)
%LOADDATA Summary of this function goes here
%   Detailed explanation goes here

currentDir = strcat(pwd, '\coursera-machine-learning\machine-learning-ex6\ex6\emails');
spamDir  = dir(strcat(currentDir,'\spam\spam'));
spamDir = spamDir(3:end);
spam2Dir = dir(strcat(currentDir,'\spam\spam_2'));
spam2Dir = spam2Dir(3:end);
nspamEasyDir = dir(strcat(currentDir,'\non-spam\easy_ham\'));
nspamEasyDir = nspamEasyDir(3:end);
nspamHardDir = dir(strcat(currentDir,'\non-spam\hard_ham\'));
nspamHardDir = nspamHardDir(3:end);

%Handy variables
s1 = length(spamDir);
s2 = length(spam2Dir);
e1 = length(nspamEasyDir);
e2 = length(nspamHardDir);
totalLength = 25%s1 + s2 + e1 + e2;

emails = zeros(totalLength, vocab_length);

X = [];
y = [];
Xval = [];
yval = [];
Xtest = [];
ytest = [];
labels = zeros(totalLength, 1);

%Read all text in
for i = 1:totalLength
    
    fprintf('%i, ', i);
    
    %spam
    if (i <= 5)
        newEmail = readFile(spamDir(i + 2).name); %Raw text data
        labels(i) = 1; %Spam
    end

    %spam_2
    if (i > 5 && i <= 10)
        newEmail = readFile(spam2Dir(i + 2).name);
        labels(i) = 1;
    end
    
    %easy_ham
    if (i > 10 && i <= 15)
        newEmail = readFile(nspamEasyDir(i + 2).name);
        labels(i) = 0; %Not spam
    end
    
    %hard_ham
    if (i > 15 && i <= 25)
        newEmail = readFile(nspamHardDir(i + 2).name);
        labels(i) = 0;
    end
    
    word_indicies = processEmail(newEmail);   %Tokenized, stemmed, machine readable data
    features = emailFeatures(word_indicies);  %Conversion to vectorized data
    emails(i,:) = features';
end 

permutation = [emails, labels];
permutation = permutation(randperm(size(emails,1)),:);

for i = 1:size(permutation,1)
    if (mod(i,5) == 4)
       Xval = [Xval; permutation(i, 1:end-1)];
       yval = [yval; permutation(i, end)];
    end
    if (mod(i,5) == 0)
        Xtest = [Xtest; permutation(i, 1:end-1)];
        ytest = [ytest; permutation(i, end)];
    end
    X = [X; permutation(i, 1:end-1)];
    y = [y; permutation(i, end)];
end

end

