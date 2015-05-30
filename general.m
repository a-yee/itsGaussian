% script file of quick commands run in matlab

%{
% extracting unique word indices from lam_index array
uni = unique( INDEX(:,2) );

% loading csv file to find the unique words of lamphier's sent emails
fileID = fopen('vocabulary.csv');
words = textscan(fileID, '%d%s', 'delimiter',',');
fclose(fileID);
%}

%{
% Loading values into matlab
INDEX = csvread('lam_index.csv');
uni = csvread('lam_uniqueWords.csv');
emails_sent = csvread('lam_sent.csv');
%}

%{
% uni = unique vector of words (lam_uniqueWords.csv)
% INDEX[:,1] = list of emails (lam_index.csv)
% emails_sent = list of unique email row number indices from meta (lam_sent.csv)

upperb1 = size(uni);
word_freq = zeros(upperb1, 2);
% Making partial copy of uni array
for i = 1:upperb1
      word_freq(i,1) = uni(i);
end 

% build frequency A = (word_index,frequency of word) 
for j = 1:upperb1
    ind = find( INDEX(:,2) == word_freq(j,1) );
    Xtarget = INDEX(ind,2:3);
    word_freq(j,2) = sum( Xtarget(:,2) );    
end

clear upperb1

ind = find( word_freq(:,2) >= 15 );
Xtarget = word_freq(ind,:);

%}
%{
% finding the frequency of senders inside the football set
uni_senders = [];
for i = 1:10
    uni_senders = [test; find(full(hist(:,i)) ~= 0)];
end


uni_senders1 = unique(uni_senders);
uni_senders1 = [uni_senders1, zeros(size(uni_senders1),1)];
for i = 1:size(uni_senders1(:,1))
    uni_senders1(i,2) = sum(uni_senders(:,1) == uni_senders1(i,1));
end
%}

%{
upperb = size(ff);
uni_senders2 = [];
for i=1:upperb
    uni_senders2 = [uni_senders2; uni_senders1(ff(i),:)];
end
%}


%}

upperb = size(fb_index);
fb_senders=[];
for i = 1:upperb
    fb_senders{i,1} = senders{fb_index(i),1};
end

