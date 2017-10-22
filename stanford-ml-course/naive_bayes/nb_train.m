clc; clear; close all;

[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN');

trainMatrix = full(spmatrix);
trainCategory = trainCategory';
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);

%% Description
% trainMatrix is now a (numTrainDocs x numTokens) matrix.
% Each row represents a unique document (email).
% The j-th column of the row $i$ represents the number of times the j-th
% token appeared in email $i$. 

% tokenlist is a long string containing the list of all tokens (words).
% These tokens are easily known by position in the file TOKENS_LIST

% trainCategory is a (1 x numTrainDocs) vector containing the true 
% classifications for the documents just read in. The i-th entry gives the 
% correct class for the i-th email (which corresponds to the i-th row in 
% the document word matrix).

% Spam documents are indicated as class 1, and non-spam as class 0.
% Note that for the SVM, you would want to convert these to +1 and -1.


%% YOUR CODE HERE

idx = logical(trainCategory);
spam = trainMatrix(idx,:) > 0;
nspam = trainMatrix(~idx,:) > 0;

phi_null = sum(nspam, 2) ./ size(spam,1) ./ ;
phi_one = sum(spam, 2);
phi_y = full(sum(trainCategory) ./ numTrainDocs);




