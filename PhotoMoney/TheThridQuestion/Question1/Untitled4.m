[X,Y] = meshgrid( 22.4931:0.01: 23.8784,112.6833:0.01:114.4936);
%%
[X,Y] = meshgrid(  23.8784:0.01:22.4931,114.4936:0.01:112.6833);
%%
CompletedTaskData = xlsread('..\Data\Assign.xls');
[m,n] = size(X);
K = zeros(m,n);
for i = 1:m
    for j = 1:n
        K(i,j) = findTopTenClosestPoint(CompletedTaskData,X(1,j),Y(i,1));
    end
end
%%
mesh(X,Y,K);
%%
% 计算距离三个中心的距离以及最近的距离  同时对密度数据们归一化
Kmeans_center = [23.1135,113.2603;22.9163,113.8287;22.6449,114.0765;];
aDsoai = xlsread('C:\Users\Lenovo\Desktop\对应附件一的.xlsx');
[m,~] = size(aDsoai);
aDsoai = [aDsoai,distance(aDsoai(:,1),aDsoai(:,2),Kmeans_center(1,1),Kmeans_center(1,2))];
aDsoai = [aDsoai,distance(aDsoai(:,1),aDsoai(:,2),Kmeans_center(2,1),Kmeans_center(2,2))];
aDsoai = [aDsoai,distance(aDsoai(:,1),aDsoai(:,2),Kmeans_center(3,1),Kmeans_center(3,2))];
aDsoai = [aDsoai,zeros(m,1)];
aDsoai(:,11) = min(aDsoai(:,8:10))
