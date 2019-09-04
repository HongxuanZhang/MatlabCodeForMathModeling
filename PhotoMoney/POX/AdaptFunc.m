function y = AdaptFunc(x,AdaptFuncData,uesToPredictPrice)
    %y = ((sin(x(1)^2+x(2)^2))^2-cos(x(1)^2+x(2)^2)+1)/((1+0.1*(x(1)^2+x(2)^2))^2)-0.7;
    Price_delta = [x(1);x(2);x(3)];
    Price = uesToPredictPrice.predictFcn(AdaptFuncData(:,1:5));
    [m,~] = size(Price);
    for i = 1:m
        Price(i,1) = Price(i,1) + x(justWhichArea(AdaptFuncData(i,1).*23,AdaptFuncData(i,2).*113));
    end
    ti = - 5.97108 + 0.09115.*Price - 2.29772.*AdaptFuncData(:,8)+2.02514.*AdaptFuncData(:,9)+0.22267.*AdaptFuncData(:,7)-3.27788.*AdaptFuncData(:,6);
    SuccessRate = 1./(1+exp(-ti));
    Success = mean(SuccessRate);
    y = 60./Success + 0.6.*sum(Price)./(8.*40);
end