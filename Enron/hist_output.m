output = fopen('word_hist.txt','w');
parfor i=1:n    
    temp = full(hist(i,:));
    fprintf(output,'%u,',temp(1,1:end-1));
    fprintf(output,'%u,\n',temp(1,end));
    disp(i);
end 
fclose(output);