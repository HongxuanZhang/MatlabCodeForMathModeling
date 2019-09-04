x = [7.2472;6.7869;9.5296];
Price = uesToPredictPrice.predictFcn(RegressionData(:,1:5));
[m,~] = size(Price);
Price2 = [];
for i = 1:m
    Price2 = [Price2;Price(i,1) + x(justWhichArea(NewAssignment(i,1),NewAssignment(i,2)))];
end