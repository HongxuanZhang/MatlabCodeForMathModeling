StackedPriceFinshed = [];
for i = 65:0.5:85
    [m,~]=size(CompletedTaskData(CompletedTaskData(:,3)==i,4));
    if m ~= 0 
        m2 = sum(CompletedTaskData(CompletedTaskData(:,3)==i,4));
        StackedPriceFinshed = [StackedPriceFinshed;i,m2,m-m2];
    end
end
%%
StackedPriceFinshed = [StackedPriceFinshed,StackedPriceFinshed(:,2)./(StackedPriceFinshed(:,2)+StackedPriceFinshed(:,3))]