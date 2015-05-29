emails = [];
parfor j=1:126
    filename = strcat('WordCounts\Sparse_Word_',num2str(j-1),'.txt');
    temp = dlmread(filename);
    temp = [temp(:,1)+2000*(j-1)+1,temp(:,2)+1,temp(:,3)];
    emails = [emails;temp];
    disp(j);
end