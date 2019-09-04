%%
% 本文件用于计算胡安睿的回归模型的数据
% load regressionData_HuAnRui.mat
[m,~] = size(Task1);
CalData=[];
Price = [];
for i = 1:m 
    if aDsoai(i,7)==1
        CalData = [CalData;(Task1(i,3)-0.0291)./(57.6110 - 0.0291),(Task1(i,4)+19.4326)./(119.9267 + 19.4326),(Task1(i,5)-0.0351)./(101.1338 - 0.0351),Task1(i,11)];
%         CalData(i,1) = (aDsoai(i,3)-0.0291)./(57.6110 - 0.0291);
%         CalData(i,2) = (aDsoai(i,4)+19.4326)./(119.9267 + 19.4326);
%         CalData(i,3) = (aDsoai(i,5)-0.0351)./(101.1338 - 0.0351);
%         CalData(i,4) = aDsoai(i,11);
        Price = [Price;Task1(i,6)];
    end
end
CalData = [CalData,Price];
% Price_re = -15.7167.*CalData(:,3)-21.5733.*CalData(:,1)+10.9622.*CalData(:,4)+68.7914;
% 
% Price_re-Price