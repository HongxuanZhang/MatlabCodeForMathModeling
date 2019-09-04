function [binseq] = decimal2binary(number,BinSq,Decval)
binseq = zeros(1,7);
for i =1:128
    if Decval(1,i) == number
        str = BinSq(i,:);
        for j = 1:length(str)
            number = str2num(str(j));
            binseq(1,j) = number;
        end
        break;
    end
end