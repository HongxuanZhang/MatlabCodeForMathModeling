typen = 43;

a2 = xlsread('D:\coding!!\Matlab\blankingproblem\Question2.xlsx');
b2 = zeros(4,43);
for i = 1:43
    row_num = ( i - mod(i,10))./10;
    if mod(i,10) == 0
        row_num = row_num - 1;
    end
    b2(1,i) = a2(1 + row_num.*4,i - row_num.*10);
    b2(2,i) = a2(2 + row_num.*4,i - row_num.*10);
    b2(3,i) = a2(3 + row_num.*4,i - row_num.*10);
    b2(4,i) = a2(4 + row_num.*4,i - row_num.*10);
end
componentData2 = b2;

priority = ones(1,typen);
priority(1,[3,7,9,12,15,18,20,25, 28,36]) = 10;
componentData2 = [componentData2;priority];
prior_val = calculatePriority2(componentData2);
componentData2 = [componentData2;prior_val];
temp = sortrows(componentData2',6,'descend');
componentData2 = temp';

componentData2_20 = componentData2(:,(componentData2(3,:)==20));
componentData2_30 = componentData2(:,(componentData2(3,:)==30));
componentData2_35 = componentData2(:,(componentData2(3,:)==35));
componentData2_50 = componentData2(:,(componentData2(3,:)==50));

[Stripe_20,componentData2_20] = newDay(componentData2_20);
[Stripe_30,componentData2_30] = newDay(componentData2_30);
[Stripe_35,componentData2_35] = newDay(componentData2_35);
[Stripe_50,componentData2_50] = newDay(componentData2_50);

Stripe_20((Stripe_20(:,45))==3000,:) = [];
Stripe_30((Stripe_30(:,45))==3000,:) = [];
Stripe_35((Stripe_35(:,45))==3000,:) = [];
Stripe_50((Stripe_50(:,45))==3000,:) = [];