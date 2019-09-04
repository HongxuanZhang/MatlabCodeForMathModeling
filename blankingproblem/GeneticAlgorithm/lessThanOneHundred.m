function [whetherLess] = lessThanOneHundred(pop)
ant = binary2decimal(pop);
for day = 1:10
    if sum(ant(1,(day-1).*116+1:day.*116))>100
        whetherLess = 0;
    end
end
whetherLess = 1;